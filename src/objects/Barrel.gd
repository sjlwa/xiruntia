extends Area2D

var filledPercentage = 0
var isPlayerClose = false

var minimap_icon = "barrel_icon"

func _ready():
	$ProgressBar.value = 0

func _process(delta):	
	var initial_recipient = Resources.recipient

	if Input.is_action_pressed("ui_accept") && isPlayerClose && Resources.recipient > 0:
		$ProgressBar.visible = true
		$Drop.visible = false
		
		if Resources.recipient <= 50:
			filledPercentage += 2
		else:
			filledPercentage += 1
			
		$ProgressBar.value = filledPercentage
			
		if filledPercentage == 100:
			$Sound.play()
			if initial_recipient <= 75:
				Resources.balance += 10
			else:
				Resources.balance += 15
			
			Resources.recipient = 0		
	elif Input.is_action_just_released("ui_accept") && isPlayerClose:
		filledPercentage = 0
		$ProgressBar.visible = false
		$Drop.visible = true
				

func _on_Barrel_body_entered(body):
	if body.name == 'Player':
		isPlayerClose = true
		$Drop.visible = true


func _on_Barrel_body_exited(body):
	if body.name == 'Player':
		$Drop.visible = false
		$ProgressBar.visible = false
		isPlayerClose = false
		filledPercentage = 0

