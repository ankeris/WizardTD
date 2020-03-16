extends Navigation
onready var start_pos = $'./start_pos';
onready var end_pos = $'./end_pos';
var path = []
var path_ind = 0
const move_speed = 6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var path = get_simple_path(start_pos.global_transform.origin, end_pos.global_transform.origin)
	print(start_pos.global_transform.origin)
	print(end_pos.global_transform.origin)
	print(get_simple_path(start_pos.global_transform.origin, end_pos.global_transform.origin))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
