extends Reference

class_name Utils
func await(node, seconds):
	var timer = Timer.new()
	node.add_child(timer)
	timer.set_wait_time(seconds)
	timer.set_one_shot(true)
	timer.start()
	yield(timer, "timeout")
