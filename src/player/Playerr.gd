extends KinematicBody2D

export var speed = 300

func start(pos):
	position = pos
	show()	
	$CollisionShape2D.disabled = false
	
func _process(delta):
	var velocity = Vector2()
	
	#position = Vector2(OS.get_window_size().x/2,OS.get_window_size().y/2)
	
	if Input.is_action_pressed("ui_right"):
		if (position.x < OS.get_window_size().x - 10):
			velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		if (position.x > 10):
			velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		if (position.y < OS.get_window_size().y - 10):		
			velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		if (position.y > 10):	
			velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.flip_h = velocity.x > 0	
