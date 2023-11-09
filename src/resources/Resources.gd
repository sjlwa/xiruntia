extends Node

### GUI
var alert_message_text = '@@@@@@Texto@@@@@@'
var alert_message_visible = true
var is_alert_message_timer_blocked = false

### Game state
var camera_position = Vector2()
var prev_scene = ''
var curr_dialog_parent = ''
var game_over = false

var is_city_unlocked = false

### Town State
var started = false
var finished = false
var recipient = 0
var balance = 50
var time = 60 * 3
var time_left = time
var balanceLose = 0.005

var timer = Timer.new()

func _ready():
	timer.connect("timeout", self, "finish")
	timer.set_wait_time(time)
	timer.set_one_shot(true)
	add_child(timer)
	
func start_timer():
	timer.start()	
	
func _process(delta):

	if timer.get_time_left() > 0:
		time_left = timer.get_time_left()
		balance -= balanceLose
		game_over = false		
	elif started:
		game_over = true
		
	## Pendiente para eliminar balas perdidas
	#print(camera_position + OS.get_window_size())
	
func finish():
	print('Se termino')
	
func init():
	Resources.game_over = false
	Resources.started = false
	Resources.finished = false
	Resources.recipient = 0
	Resources.balance = 50
	Resources.is_city_unlocked = false
	Resources.time_left = Resources.time
