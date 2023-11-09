extends YSort

func _ready():
	randomize()
		
	if Resources.prev_scene == 'Rural':
		print('Vengo de rural')
		$Player.position = Vector2(-400, -420)

	NewBarrels.loadBarrels()	
	

func _process(delta):
	if Resources.game_over:
		$AudioStreamPlayer.stop()


func _on_RuralEntrance_body_entered(body):
	if body.name == 'Player':
		Resources.prev_scene = 'Urban'
		get_tree().change_scene("res://src/RuralScene.tscn")

