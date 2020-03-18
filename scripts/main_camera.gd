extends Camera

const ray_length = 1000
onready var towers_path = $'../GridMap/Navigation/towers_path'

func _ready():
#	print(towers_path.get_meshes())
	pass

func _input(event):
	var from = project_ray_origin(event.position)
	var to = from + project_ray_normal(event.position) * ray_length
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(from, to, [])
	var whos_there = get_object_under_mouse(from, to, space_state)
	# handle click
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print(result)
		var smth = towers_path.get_cell_item(result.position.x, 0.2, result.position.z)
		print(smth)
#		print(whos_there.collider.world_to_map())		

func get_object_under_mouse(ray_from, ray_to, space_state):
	return space_state.intersect_ray(ray_from, ray_to)
	
