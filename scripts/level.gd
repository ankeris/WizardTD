extends Node
var Utils = preload("res://scripts/@utils/index.gd").new()

# Declare member variables here. Examples:
var mob = preload("res://scenes/mobs/mob.tscn")
onready var start_pos = $'manual_map/walk_path/navigation/start_block/start_pos'
onready var mobs_scene = $'mobs'
var radius = 5
const mobs_count = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(spawn_mobs(mobs_count, 1), "completed")
#	yield(spawn_mobs(mobs_count, 1), "completed")
	pass # Replace with function body.

func spawn_mobs(how_many, how_frequently):
	for n in range(how_many):
		var new_mob = mob.instance()
		new_mob.global_transform.origin = start_pos.global_transform.origin
		mobs_scene.add_child(new_mob)
		yield(Utils.await(self, 1), "completed")


#func 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
