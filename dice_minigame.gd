extends CanvasLayer

@onready var title_label = $CenterContainer/VBoxContainer/TitleLabel
@onready var result_label = $CenterContainer/VBoxContainer/ResultLabel
@onready var roll_button = $CenterContainer/VBoxContainer/RollButton

func _ready():
	visible = true
	title_label.text = "Risk Roll"
	result_label.text = "Press Roll"
	roll_button.pressed.connect(_on_roll_button_pressed)

func _on_roll_button_pressed():
	var roll = randi_range(1, 6)
	result_label.text = "You rolled: %d" % roll
	if roll <= 2:
		title_label.text = "Suspicion Raised!!"
	elif roll > 2 and roll < 4:
		title_label.text = "Looted"
	else:
		title_label.text = "EXTRA LOOTED"
	await get_tree().create_timer(1.0).timeout
	queue_free()
