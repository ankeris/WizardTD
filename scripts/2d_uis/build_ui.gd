extends Node2D
onready var build_ui_position = $"../build_ui_position"

func _process(delta):
	var pos = build_ui_position.global_transform.origin
	var cam = get_tree().get_root().get_camera()
	var screenpos = cam.unproject_position(pos)
	set_position(Vector2(screenpos.x , screenpos.y))
