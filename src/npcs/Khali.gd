extends Area2D

export var speed = 200
var close = false
var minimap_icon = "khali_head_icon"

func start(pos):
	position = pos


func _input(event):
	if event.is_action_pressed("ui_accept") && close:
		$DialogBox/Control.visible = true


func _on_VisibleArea_body_entered(body):
	if 'Player' in body.to_string():
		$msg.visible = true
		close = true


func _on_VisibleArea_body_exited(body):
	$msg.visible = false
	close = false
	$DialogBox/Control.visible = false

