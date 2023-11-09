extends YSort

func _ready():
	if Resources.prev_scene == 'Urban':
		$Player.position = Vector2(5400, 1900)
		
	Resources.is_alert_message_timer_blocked = false
	Resources.alert_message_text = "Habla con los habitantes de Xiruntia"
	
	NewBarrels.loadBarrels()
	
func _on_Button_pressed():
	get_tree().change_scene("res://src/UrbanScene.tscn")


func _process(delta):
	if Resources.game_over:
		$AudioStreamPlayer.stop()


func _on_UrbanEntrance_body_entered(body):
	if body.name == 'Player' && Resources.is_city_unlocked:
		Resources.prev_scene = 'Rural'
		get_tree().change_scene("res://src/UrbanScene.tscn")
