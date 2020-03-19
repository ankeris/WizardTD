extends Camera

const ray_length = 1000
onready var towers_path = $'../GridMap/Navigation/towers_path'

func _ready():
	print(towers_path)
	print(towers_path.get_meshes()[0].origin)
	pass

func _input(event):
	var from = project_ray_origin(event.position)
	var to = from + project_ray_normal(event.position) * ray_length
	var space_state = get_world().direct_space_state
	var raycast_object = space_state.intersect_ray(from, to, [])
	
	# handle click
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print(raycast_object.position)
		var grid_map = raycast_object.collider
		var grid_map_id = raycast_object.collider_id
		if (grid_map_id == 1211):
			find_mesh_in_grid(grid_map, raycast_object)
	#		print(whos_there.collider.world_to_map())

# maybe submit a PR for this feature
func find_mesh_in_grid(grid_map, raycast_object):
	var cell_pos = grid_map.map_to_world(raycast_object.position.x, raycast_object.position.y, raycast_object.position.z)
	print(cell_pos)
#	var meshes = towers_path.get_meshes()
#	for x in range(meshes.size()):
#		if (x % 2 == 0):
#			print(meshes[x].origin)
#	print(cell_pos == towers_path.get_meshes()[0].origin)
