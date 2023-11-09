extends Node

var isPlaying = false
var saved = false

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS	
	
func _process(delta):
	$Control/PausePanel2/Khali.play('win')
	$Control/PausePanel2/Reza.play('win')
	
	if Resources.game_over && Resources.balance >= 50:
		$Control/PausePanel4/TotalCoins.text = "Total de monedas: " + str(PlayerState.coins)
		if !saved:
			PlayerState.day += 1
			Resources.balanceLose += 0.002
			SaveSystem.save()
			saved = true
		
		#get_tree().paused = true
		$Control.visible = true
		
		if !isPlaying:
			$AudioStreamPlayer.play()
			isPlaying = true
			
	else:
		$Control.visible = false
			
			
func _on_GoToMenuButton_pressed():
	saved = false
	get_tree().paused = false
	Resources.init()
	get_tree().change_scene("res://src/RuralScene.tscn")
