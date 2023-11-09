extends Area2D

var close = false
var minimap_icon = "serek_head_icon"

func start(pos):
	position = pos
			
#func _on_VisibleArea_area_entered(area):
#	if 'Player' in area.to_string():
#		$msg.visible = true
#		close = true
			
#func _on_VisibleArea_area_exited(area):
#	$msg.visible = false
#	close = false
#	$DialogBox/Control.visible = false
#	$CanvasStore/Store.visible = false

func _input(event):
	if event.is_action_pressed("ui_accept") && close:
		$DialogBox/Control.visible = true


func noHandler():
	print('Elejiste no ')


func yesHandler():
	print('Donando ... ')


func _on_VisibleArea_body_entered(body):
	if 'Player' in body.to_string():
		$msg.visible = true
		close = true
		

func _on_VisibleArea_body_exited(body):
	$msg.visible = false
	close = false
	$DialogBox/Control.visible = false
	$CanvasStore/Store.visible = false

