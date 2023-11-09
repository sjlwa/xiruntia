extends RigidBody2D

var blocked = false 

func _ready():
	$Timer.connect("timeout", self, "disapear")
	$Timer.set_wait_time(1)
	$Timer.set_one_shot(true)
	add_child($Timer)
	$Timer.start()
	
func disapear():
	queue_free()

func _process(delta):
#	if position.x > OS.get_window_size().x || position.y > OS.get_window_size().y:
#		queue_free()
	#print(get_viewport)
	pass

	
func _input(event):
	if event is InputEventMouseMotion && !blocked:
		#self.rotation = (event.position - global_position).angle()
		#blocked = true
		pass

func _on_WordsBullet_body_entered(body):
	if "Hark" in body.to_string():
		body.life -= 10
