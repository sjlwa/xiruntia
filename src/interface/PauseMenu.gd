extends CanvasLayer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if $Control/PausePanel/HowToPlayMenu/Control.visible:
			$Control/PausePanel/HowToPlayMenu/Control.visible = false
		else:
			get_tree().paused = !get_tree().paused
			$Control.visible = !$Control.visible
			

func _on_ResumeButton_pressed():
	$Control.visible = false	
	get_tree().paused = false

func _on_ExitButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/Main.tscn")

func _on_HowToPlayButton_pressed():
	$Control/PausePanel/HowToPlayMenu/Control.visible = true
