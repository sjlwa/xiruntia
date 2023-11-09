extends Node

func _on_QuitButton_pressed():
	get_tree().quit()
	
func _input(event):
	if event.is_action_pressed("ui_cancel") && $HowToPlayMenu/Control.visible:
		$HowToPlayMenu/Control.visible = false

func _on_PlayButton_pressed():
	Resources.init()
	get_tree().change_scene("res://src/RuralScene.tscn")

func _on_HowToPlayButton_pressed():
	$HowToPlayMenu/Control.visible = true
