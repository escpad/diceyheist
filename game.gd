extends Node

func roll_d6():
	return randi_range(1,6)
func roll_d20():
	return randi_range(1,20)
	
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#print(roll_d20())
		pass
