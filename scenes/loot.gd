extends Area2D

#test section - area shake
var shake_time = 0.2
var shake_strength = 5
var shaking = false
var original_position

func start_shake():
	original_position = position
	shaking = true
	await get_tree().create_timer(shake_time).timeout
	position = original_position
	shaking = false
	
# end test section

var is_player_in_range = false
@onready var game_manager = get_node("../GameManager")
var dice_popup_scene = preload("res://dice_minigame.tscn")

func open_dice_minigame():
	var popup = dice_popup_scene.instantiate()
	add_child(popup)
	
func roll_d6():
	return randi_range(1,6)
	
func _ready() -> void:
	print(game_manager)
	
func _process(delta: float) -> void:
	
	# test section
	if shaking:
		position = original_position + Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)
		)
	
	if Input.is_action_just_pressed("Interact") and is_player_in_range:
		open_dice_minigame()
		#var temp = roll_d6()
		#if(temp > 5):
			#print(str(temp) + ": Steal success")
			#game_manager.add_loot(30)
			#queue_free()
		#else:
			#print(str(temp) + ": Steal failed")
			#start_shake()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		#print("Player entered")
		is_player_in_range = true;


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		#print("Player exitedas")
		is_player_in_range = false;
