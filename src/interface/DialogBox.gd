extends CanvasLayer

var dialog = null

var dialog_index = 0
var finished = false

var parent = get_parent()
var dialog_ended = false

func _ready():
	parent = get_parent()
	if parent.name == 'Khali':
		dialog = preload("res://src/npcs/KhaliDialogs.gd").dialog
	elif parent.name == 'Reza':
		dialog = RezaDialogs.get_dialog()
	elif parent.name == 'Serek':
		dialog = preload("res://src/npcs/SerekDialogs.gd").dialog
	
func _process(delta):	
	$Control/DialogBox/Continue.visible = finished
	#$Continue/AnimationPlayer.play()		
	
			
func _input(event):
	if event.is_action_pressed('ui_accept') :
		if parent.close:
			load_dialog()
			if parent.name == 'Reza' && dialog_ended && !Resources.started:
				Resources.started = true
				Resources.start_timer()
				Resources.alert_message_text = "Ve a la ciudad"
				Resources.alert_message_visible = true
				Resources.is_city_unlocked = true
			if parent.name == 'Serek' && dialog_ended:
				parent.get_node('CanvasStore').get_node('Store').visible = true
				
			
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Control/DialogBox/RichTextLabel.bbcode_text = str(dialog[dialog_index])
		$Control/DialogBox/RichTextLabel.percent_visible = 0
		$Control/DialogBox/Tween.interpolate_property(
			$Control/DialogBox/RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Control/DialogBox/Tween.start()
		
	if dialog_index == dialog.size() - 1:
		
#		if parent.get_name() == 'Khali':
#			Resources.start_timer()
		
		dialog_ended = true
		$Control.visible = false
		#dialog_index = 0	

	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
