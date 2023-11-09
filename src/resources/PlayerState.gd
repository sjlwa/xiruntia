extends Node

var currentAttack = ''
var coins = 0
var stamina = 100
var staminaTimer = Timer.new()
var day = 1

func _ready():
	staminaTimer.connect('timeout', self, 'normalizeStamina')	
	staminaTimer.set_wait_time(1)
	staminaTimer.set_one_shot(false)
	add_child(staminaTimer)
	staminaTimer.start()

	
func normalizeStamina():
	if stamina <= 98:
		stamina += 2
	
