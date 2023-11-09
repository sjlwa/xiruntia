extends Node

const WastedWater = preload("res://src/enemies/WastedWater.tscn")
const Hark = preload("res://src/enemies/Hark.tscn")

func _ready():
	for i in 7:
		summon_water()
		summon_hark()

func get_random_position():
	#var posX = randi() % int(OS.get_window_size().x) + 1 
	#var posY = randi() % int(OS.get_window_size().y) + 1 
	var posX = randi() % int(OS.get_window_size().x * 4) - (OS.get_window_size().x) 
	var posY = randi() % int(OS.get_window_size().y * 4) - (OS.get_window_size().y) 
	return Vector2(posX, posY);
	
func summon_water():
	var water = WastedWater.instance()
	water.start(get_random_position())
	add_child(water)
	
func summon_hark():
	var hark = Hark.instance()
	hark.start(get_random_position())
	add_child(hark)
