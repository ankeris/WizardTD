extends Camera

const ray_length = 1000
const tower_spot_collider_name = 'tower_spot_collider'
onready var towers_path = $'../GridMap/Navigation/towers_path'
var previously_selected_tower_path_flag;

func _ready():
	pass

func _input(event):
	var from = project_ray_origin(event.position)
	var to = from + project_ray_normal(event.position) * ray_length
	var space_state = get_world().direct_space_state
	var raycast_object = space_state.intersect_ray(from, to, [])
	
	# handle click
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and raycast_object:
		var target_collider = raycast_object.collider
		if (target_collider.name == tower_spot_collider_name):
			var tower_spot_scene = target_collider.get_parent().get_parent()
			var tower_spot_flag = tower_spot_scene.get_node("flag")
			if (previously_selected_tower_path_flag):
				previously_selected_tower_path_flag.visible = false
			tower_spot_flag.visible = true
			tower_spot_flag.rotate_y(rand_range(1,11))
			previously_selected_tower_path_flag = tower_spot_flag;
			

# maybe submit a PR for this feature

