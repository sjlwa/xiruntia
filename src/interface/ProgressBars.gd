extends Control

func _ready():
	$Bars/TimeBar.value = Resources.time
	$Bars/TimeBar.max_value = Resources.time
	
func _process(delta):
	$Bars/TimeBar.value = Resources.time_left 
	$Bars/BalanceBar.value = Resources.balance
	$Bars/RecipientBar.value = Resources.recipient
	$Bars/StaminaBar.value = PlayerState.stamina
