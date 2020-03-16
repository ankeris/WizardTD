extends Spatial
# # # # # # #
onready var kinematic_body = get_parent()

# HP Health Points
puppet var hp: int = 90
var hp_max: int = 100
puppet var hp_regenerable: int = 100
var hp_regeneration: int = 1
var hp_regeneration_interval: int = 5
signal hp_changed(hp, hp_reg, hp_max)

# Walk

# Attack
puppet var attacking: bool = false
var attack_speed: float = 1

# Time since latest damage
var time_hit: float = 0

# State
var dead: bool = false
var direction: Vector3 = Vector3()
var selected: bool = false

# Other
onready var navigation = $"../../GridMap/Navigation"
onready var end_pos = $"../../GridMap/Navigation/end_pos"

# Path finding vars
var path = []
var path_ind = 0
const move_speed = 3

func _ready():
	move_to(end_pos.global_transform.origin);
	print(navigation);

func _physics_process(_delta):
	if path_ind < path.size():
		var move_vec = (path[path_ind] - kinematic_body.global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
			# Prevent from breaking - check if index is in scope of array
#			if (not path_ind >= path.size()):
#				look_at(path[path_ind], Vector3.UP)
		else:
			kinematic_body.move_and_slide(move_vec.normalized() * move_speed, Vector3(0, 1, 0))

func move_to(target_pos):
	path = []
	path = navigation.get_simple_path(kinematic_body.global_transform.origin, target_pos)
	path.set(0, kinematic_body.global_transform.origin)
	path_ind = 0

