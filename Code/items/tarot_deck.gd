extends Node2D
var lootbox_items = Global.lootbox_items
func _ready() -> void:
	if len(lootbox_items) >= 2:
		Global.multipler *= lootbox_items
	Global.loot_open(1)
