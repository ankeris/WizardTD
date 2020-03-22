extends Camera

const ray_length = 1000
const tower_spot_collider_name = 'tower_spot_collider'
var previously_selected_tower_path_flag;
var previous_build_ui;
var previous_build_ui_tower_path;

# Scenes
onready var towers_path = $'../GridMap/Navigation/towers_path'
onready var build_ui = preload("res://scenes/2d_uis/build_ui.tscn")

func _ready():
	pass

func _input(event):
	var from = project_ray_origin(event.position)
	var to = from + project_ray_normal(event.position) * ray_length
	var space_state = get_world().direct_space_state
	var raycast_object = space_state.intersect_ray(from, to, [])
	
	# On click, select the TOWER NODE and put a flag on it
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and raycast_object:
		var target_collider = raycast_object.collider
		var selected_node = select_tower_node(target_collider)
		if (target_collider.name == tower_spot_collider_name):
			provide_tower_options(selected_node)


func select_tower_node(target_collider):
	if (target_collider.name == tower_spot_collider_name):
			var tower_spot_scene = target_collider.get_parent().get_parent()
			var tower_spot_flag = tower_spot_scene.get_node("flag")
			if (previously_selected_tower_path_flag):
				previously_selected_tower_path_flag.visible = false
			tower_spot_flag.visible = true
			tower_spot_flag.rotate_y(rand_range(1,11))
			previously_selected_tower_path_flag = tower_spot_flag;
			return tower_spot_scene
		

func provide_tower_options(tower_path_node):
	# clear up before spawn
	clean_build_ui()
	var new_mob = build_ui.instance()
	tower_path_node.add_child(new_mob)
	previous_build_ui = new_mob;
	previous_build_ui_tower_path = tower_path_node;


func clean_build_ui():
	if (previous_build_ui_tower_path && previous_build_ui):
		previous_build_ui_tower_path.remove_child(previous_build_ui)
# maybe submit a PR for this feature

