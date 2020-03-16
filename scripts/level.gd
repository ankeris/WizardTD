extends Node


# Declare member variables here. Examples:
var mob = preload("res://scenes/mobs/mob.tscn")
onready var start_pos = $'GridMap/Navigation/start_pos'
var radius = 5
const mobs_count = 5

var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 1
	timer.connect("timeout", self, "_timeout")
	
func _timeout():
	var new_mob = mob.instance()
	new_mob.global_transform.origin = start_pos.global_transform.origin
	add_child(new_mob)
	print("Timed out!")

# Called when the node enters the scene tree for the first time.
func _ready():
#	for n in range(mobs_count):
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
