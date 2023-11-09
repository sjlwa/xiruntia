extends Node

var index = 0
var list = [
	{"position": Vector2(2700, 800), "location": 'RuralScene'},
	{"position": Vector2(4000, 1800), "location": 'RuralScene'},
	{"position": Vector2(-100, -400), "location": 'UrbanScene'}
]

const Barrel = preload('res://src/objects/Barrel.tscn')

func getPrice():
	return (index+1) * 100  
	
func isLastBarrel():
	return index == len(list) 
	
func _ready():
	loadBarrels()
	
func loadBarrels():		
	for i in range(index):
		var location = get_tree().get_root().get_node(list[i].location)
		_addBarrel(location, i)

func _addBarrel(location, i):
	if location:
		var barrel = Barrel.instance()
		barrel.scale = Vector2(2,2)
		barrel.position = list[i].position
		barrel.add_to_group('minimap_objects')
		location.add_child(barrel)
		
		var minimap = location.get_node('GUI/MiniMap')
		minimap.refresh()


func addBarrel():	
	if index < len(list):
		var location = get_tree().get_root().get_node(list[index].location)				
		_addBarrel(location, index)
		
		index += 1
