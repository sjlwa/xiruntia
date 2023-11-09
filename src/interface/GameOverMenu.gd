extends Node

var isPlaying = false
var saved = false

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
func _process(delta):

	if Resources.game_over && Resources.balance < 50:
		
		if !saved:
			PlayerState.day = 1
			PlayerState.coins = 0
			Resources.balanceLose = 0.005
			NewBarrels.index = 0
			PlayerState.stamina = 100
			SaveSystem.save()
			saved = true
		
		#get_tree().paused = true
		$Control.visible = true
		
		if !isPlaying:
			$AudioStreamPlayer.play()
			isPlaying = true

func _on_GoToMenuButton_pressed():
	saved = false
	get_tree().paused = false
	get_tree().change_scene("res://src/Main.tscn")
