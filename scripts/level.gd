extends Node


# Declare member variables here. Examples:
var mob = preload("res://scenes/mobs/mob.tscn")
onready var start_pos = $'GridMap/Navigation/start_pos'
var radius = 5
const mobs_count = 3

onready var timer = $'Timer'

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in range(mobs_count):
		timer.set_wait_time(1)
		timer.set_one_shot(true)
		timer.start()
		yield(timer, "timeout")
		var new_mob = mob.instance()
		new_mob.global_transform.origin = start_pos.global_transform.origin
		add_child(new_mob)

#	for n in range(mobs_count):
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
