extends RigidBody2D

var startPosition = Vector2()
var value

func _ready():
	randomize()
	value = (randi() % 3) + 1
	$Timer.connect("timeout", self, 'disappear')

func disappear():
	queue_free()
	

func start(pos):
	startPosition = pos - Vector2(100, 100)
	position = startPosition

func _process(delta):
	if position.y > startPosition.y + 50:
		mode = 1


func _on_Area2D_body_entered(body):
	if 'Player' == body.name:
		PlayerState.coins += value
		$Sound.play()
		hide()
		$Timer.start()

