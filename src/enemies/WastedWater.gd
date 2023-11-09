extends Area2D

var isPlayerClose = false 
var collectedPercentage = 0
var completed = false

var minimap_icon = "water_wasting_icon"
var queue_freed = false

func start(pos):
	position = pos
	
func _process(delta):
	if isPlayerClose:
		if Input.is_action_pressed("ui_accept"):
			$alert.visible = false
			$Control.visible = true
			collectedPercentage += 1
			$Control/ProgressBar.value = collectedPercentage
			if collectedPercentage == 100:
				completed = true
				Resources.recipient += 22
			
		elif Input.is_action_just_released("ui_accept"):
			$alert.visible = true
			$Control.visible = false		
			collectedPercentage = 0
		
	if completed:
		queue_freed = true
		minimap_icon = ''
		remove_from_group('minimap_objects')
		queue_free()
 

func _on_WastedWater_body_entered(body):
	if body.name == 'Player':
		$alert.visible = true
		isPlayerClose = true


func _on_WastedWater_body_exited(body):
	if body.name == 'Player':
		$alert.visible = false
		$Control.visible = false
		isPlayerClose = false
		completed = false
		collectedPercentage = 0
