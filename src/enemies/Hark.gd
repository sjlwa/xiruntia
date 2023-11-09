extends KinematicBody2D

export (int) var speed = 15000
var isPlayerClose = false
var onDispute = false 
var life = 100
var minimap_icon = "hark_head_icon"

const CoinClass = preload('res://src/objects/Coin.tscn')

## Direcciones para caminata aleatoria 
const DIR_UP = 1
const DIR_DOWN = 2
const DIR_LEFT = 3
const DIR_RIGHT = 4
const DIR_UP_RIGHT = 5
const DIR_UP_LEFT = 6
const DIR_DOWN_LEFT = 7
const DIR_DOWN_RIGHT = 8
var direction_choice
var direction = 1

var movement = Vector2()
var collision

var parentScene

func set_timer():
	$Timer.connect("timeout", self, 'set_new_direction')
	$Timer.set_wait_time(1)
	$Timer.set_one_shot(false)
	$Timer.start()
	
	$TimerDisapear.connect("timeout", self, 'queue_free')
	
	
func _ready():
	parentScene = get_tree().get_root().get_node('UrbanScene')
	show()
	set_timer()
	add_to_group('minimap_objects')
	
func set_new_direction(): 
	### Genera una nueva direccion para camiar aleatoriamente
	var aux_direction_choice = (randi() % 8) + 1
	while (direction_choice == aux_direction_choice):
	# Mientras sea la misma direccion, elige otra
		aux_direction_choice = (randi() % 8) + 1	
	
	direction_choice = aux_direction_choice

func start(pos):
	position = pos
	show()	
 
func _physics_process(delta):
	movement = Vector2()
	
	collision = move_and_collide(movement * delta)
		
#	if collision != null:
#		print(collision.collider.name)
#		if 'WordsBullet' in collision.collider.name:
#			print('yeeeeaaa')

	
	### Huye del jugador en disputa
	if onDispute:
		
		$LifeBar.show()
		$LifeBar/Control/ProgressBar.value = life
		
		if life == 0:
			$Water.visible = false
			onDispute = false
			$AnimatedSprite.play("quiet")
			Resources.balance += 5
			$TimerDisapear.start()
			
			for i in range(4):
				var coin = CoinClass.instance()
				coin.start(position)
				parentScene.add_child(coin)		
		
		
		if direction_choice == DIR_UP:
			movement.y -= direction
		elif direction_choice == DIR_DOWN:
			movement.y += direction
		elif direction_choice == DIR_LEFT:
			movement.x -= direction
		elif direction_choice == DIR_RIGHT:
			movement.x += direction
		elif direction_choice == DIR_DOWN:
			movement.y += direction
			movement.x -= direction
		elif direction_choice == DIR_DOWN_RIGHT:
			movement.y += direction
			movement.x += direction
		elif direction_choice == DIR_UP_LEFT:
			movement.y -= direction
			movement.x -= direction
		elif direction_choice == DIR_UP_RIGHT:
			movement.y -= direction		
			movement.x += direction
			
		if movement.length() > 0:
			movement =+ movement.normalized() * speed
			
		move_and_slide(movement * delta)

		if movement.y != 0:
			$AnimatedSprite.flip_h = direction < 0
			
			
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if isPlayerClose && life > 0:
			onDispute = true


func _on_VisibleArea_body_entered(body):
	if body.name == 'Player':
		isPlayerClose = true
		if !onDispute:
			$alert.show()
			$alert.position = position.direction_to(body.position) * Vector2(25, 25)


func _on_VisibleArea_body_exited(body):
	if body.name == 'Player':
		isPlayerClose = false
		$alert.hide()
