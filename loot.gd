extends Area2D
var is_player_in_range = false;

func roll_d6():
	return randi_range(1,6)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && is_player_in_range:
		var temp = roll_d6()
		if(temp > 3):
			print(str(temp) + ": Steal success")
		else:
			print(str(temp) + ": Steal failed")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player entered")
		is_player_in_range = true;


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		print("Player exitedas")
		is_player_in_range = false;
