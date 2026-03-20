extends Node
func _ready() -> void:
	var number_of_opens = randi_range(1,10)
	Global.loot_open(number_of_opens)
