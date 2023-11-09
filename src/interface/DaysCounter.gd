extends Control

func _process(delta):
	$Panel/Label.text = 'Dia ' + str(PlayerState.day)
