extends Control

func _process(delta):
	$TotalCoins.text = str(PlayerState.coins)
