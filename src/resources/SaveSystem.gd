extends Node

var save_path = "res://save_game.cfg"
var config = ConfigFile.new()

func _ready():
	var err = config.load(save_path)
	if err != OK:
		return
		
	var coins = config.get_value('PlayerState', "coins")
	var day = config.get_value('PlayerState', "day")
	var barrelsIndex = config.get_value('NewBarrels', "index")
	var balanceLose = config.get_value('Resources', "balanceLose")	
	
	PlayerState.coins = coins
	PlayerState.day = day
	NewBarrels.index = barrelsIndex
	Resources.balanceLose

func save():
	config.set_value('PlayerState', 'coins', PlayerState.coins)
	config.set_value('PlayerState', 'day', PlayerState.day)	
	config.set_value('NewBarrels', 'index', NewBarrels.index)
	config.set_value('Resources', 'balanceLose', Resources.balanceLose)
	config.save(save_path)
