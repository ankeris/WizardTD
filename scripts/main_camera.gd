extends Camera

const ray_length = 1000
onready var towers_path = $'../GridMap/Navigation/towers_path'

func _ready():
	pass

func _input(event):
	var from = project_ray_origin(event.position)
	var to = from + project_ray_normal(event.position) * ray_length
	var space_state = get_world().direct_space_state
	var raycast_object = space_state.intersect_ray(from, to, [])
	
	# handle click
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print(event)

# maybe submit a PR for this feature

