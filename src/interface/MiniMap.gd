extends Node

export (NodePath) var player
export var zoom = 2

onready var icons = {
	"rural_icon": $Control/Panel/rural_icon,
	"urban_icon": $Control/Panel/urban_icon ,
	"arrow": $Control/Panel/ArrowMark,
	"khali_head_icon": $Control/Panel/khali_head_icon,
	"water_wasting_icon": $Control/Panel/water_wasting_icon,
	"hark_head_icon": $Control/Panel/hark_head_icon,
	"barrel_icon": $Control/Panel/barrel_icon,
	"reza_head_icon": $Control/Panel/reza_head_icon,
	"serek_head_icon": $Control/Panel/serek_head_icon
}

onready var player_mark = $Control/Panel/PlayerMark
onready var grid = $Control/Panel

var grid_scale
var markers = Array()


func get_player_from_scene():
	if 'UrbanScene' == get_tree().get_root().get_children()[-1].name:
		return get_tree().get_root().get_node("/root/UrbanScene/Player")
	elif 'RuralScene' == get_tree().get_root().get_children()[-1].name:
		return get_tree().get_root().get_node("/root/RuralScene/Player")

func refresh():
	var map_objects = get_tree().get_nodes_in_group("minimap_objects")
	for item in map_objects:
		var new_marker = icons[item.minimap_icon].duplicate()
		new_marker.show()
		
		var obj = {
			"marker": new_marker,
			"instance": item
		}
		
		markers.append(obj) 
		grid.add_child(obj.marker)
	

func _ready():	
	player = get_player_from_scene()
	player_mark.position = grid.rect_size / 2
	grid_scale = grid.rect_size / (grid.get_viewport_rect().size * zoom)

	refresh()
		
	
func _process(delta):
	if !player:
		return
		
	for item in markers:
		if is_instance_valid(item.instance):
			var obj_pos = (item.instance.position - player.position) * grid_scale + grid.rect_size / 2
			var margin = 16
			obj_pos.x = clamp(obj_pos.x, margin, grid.rect_size.x - margin)
			obj_pos.y = clamp(obj_pos.y, margin, grid.rect_size.y - margin)		
			item.marker.position = obj_pos
		else:
#			item.marker.queue_free() # ERROR
			item.marker.hide()

func _input(event):
	if event.is_action_pressed("ui_up") && event.is_action_pressed("ui_left"):
		player_mark.rotation = -1 * (PI / 4)
	elif event.is_action_pressed("ui_up") && event.is_action_pressed("ui_right"):
		player_mark.rotation = PI / 4
	elif event.is_action_pressed("ui_down") && event.is_action_pressed("ui_left"):
		player_mark.rotation = PI + (PI / 4)
	elif event.is_action_pressed("ui_down") && event.is_action_pressed("ui_right"):
		player_mark.rotation = PI - (PI / 4)
	elif event.is_action_pressed("ui_right"):
		player_mark.rotation = PI / 2
	elif event.is_action_pressed("ui_left"):
		player_mark.rotation = PI + (PI / 2)
	elif event.is_action_pressed("ui_up"):
		player_mark.rotation = 0
	elif event.is_action_pressed("ui_down"):
		player_mark.rotation = PI
