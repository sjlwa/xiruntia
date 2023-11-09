extends Control

var index_current_power = 0
var counter = 0
var powers

func _ready():
	
	$WordsBulletButton.connect("button_down", self, '_on_button_down', [$WordsBulletButton])
	$Button.connect("button_down", self, '_on_button_down', [$Button])
	$Button2.connect("button_down", self, '_on_button_down', [$Button2])
	$Button3.connect("button_down", self, '_on_button_down', [$Button3])
	$NullButton.connect("button_down", self, '_on_button_down', [$NullButton])
	
	powers = [
		{"button": $NullButton, "power": ''},
		{"button": $WordsBulletButton, "power": 'WordsBullet' },
		{"button": $Button, "power": '' },
		{"button": $Button2, "power": '' },
		{"button": $Button3, "power": '' }
	] 

func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed('ui_change_attack') && event.scancode == KEY_E:
		counter += 1
		index_current_power = counter % powers.size()
		
		for i in powers.size():
			if i == index_current_power:
				powers[index_current_power].button.emit_signal('button_down')
				

func _on_button_down(button_pressed):
	if button_pressed:
		button_pressed.pressed = true		
		powers[index_current_power - 1].button.set_pressed(false)
		
		PlayerState.currentAttack = powers[index_current_power].power
		
