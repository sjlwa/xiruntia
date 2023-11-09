extends KinematicBody2D

export var speed = 400
export var bullet_speed = 700

const WordsBullet = preload("res://src/objects/WordsBullet.tscn")

func _ready():
	if get_parent().name == 'RuralScene':
		$AudioSteps.stream = load("res://src/sound/steps.mp3")
	elif get_parent().name == 'UrbanScene':
		$AudioSteps.stream = load("res://src/sound/footstep.wav")

func start(pos):
	position = pos
	show()	
	$CollisionShape2D.disabled = false

	
func _process(delta):
	$Aux.look_at(get_global_mouse_position())
	
	Resources.camera_position = $Camera2D.global_position
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
			velocity.x += 1
	if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
	if Input.is_action_pressed("ui_down"):		
			velocity.y += 1
	if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		
		if !$AudioSteps.playing:
			$AudioSteps.play()

	else:
		$AnimatedSprite.stop()
		$AudioSteps.stop()
						
	#position += velocity * delta
	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.flip_h = velocity.x > 0	
		


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if PlayerState.currentAttack == 'WordsBullet' && PlayerState.stamina >= 5:
			var wordsBullet = WordsBullet.instance()
			wordsBullet.position = $Aux.get_global_position()
			wordsBullet.rotation_degrees = $Aux.rotation_degrees		
			wordsBullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated($Aux.rotation))
			get_tree().get_root().add_child(wordsBullet)
			
			PlayerState.stamina -= 3

			var sound = (randi() % 3) + 1
			if sound == 1:
				$HeyVoice1.play()
			elif sound == 2:
				$HeyVoice2.play()
