extends CanvasLayer

@onready var marker = $CenterContainer/PanelContainer/VBoxContainer/BarBackground/Marker
@onready var result_label = $CenterContainer/PanelContainer/VBoxContainer/ResultLabel
@onready var stop_button = $CenterContainer/PanelContainer/VBoxContainer/StopButton
@onready var bar = $CenterContainer/PanelContainer/VBoxContainer/BarBackground

var speed = 800.0
var direction = 1.0
var stopped = false

func _ready():
	result_label.text = "Press Stop"
	stop_button.pressed.connect(_on_stop_button_pressed)

func _process(delta):
	if stopped:
		return
	
	marker.position.x += speed * direction * delta
	
	var max_x = bar.size.x - marker.size.x
	
	if marker.position.x <= 0:
		marker.position.x = 0
		direction = 1.0
	elif marker.position.x >= max_x:
		marker.position.x = max_x
		direction = -1.0

func _on_stop_button_pressed():
	stopped = true
	var center_x = marker.position.x + (marker.size.x / 2.0)
	var ratio = center_x / bar.size.x
	if ratio < 0.33:
		result_label.text = "Suspicion up"
	elif ratio < 0.66:
		result_label.text = "Loot gained"
	else:
		result_label.text = "LOOT GAINED! SUSPICION LOWERED!"
	await get_tree().create_timer(1.0).timeout
	queue_free()
