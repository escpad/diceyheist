extends Node

var loot_collected: int = 0
var catch_chance: float = 0.0
var times_caught: int = 0
var game_over: bool = false

@onready var label = $"../LootLabel"

func update_ui():
	label.text = "Loot: " + str(loot_collected)

func _ready():
	update_ui()

func add_loot(amount: int) -> void:
	loot_collected += amount
	print("Loot collected:", loot_collected)
	label.text = "Loot: " + str(loot_collected)
