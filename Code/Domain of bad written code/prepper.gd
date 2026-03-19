extends Node

@export var lootbox_items: Array[Loot]
@export var shop_items: Array[Loot]

func _ready() -> void:
	Global.lootbox_items = lootbox_items
	Global.shop_items = shop_items

	Global.calculate_items()

	get_tree().change_scene_to_file("res://Scenes/map.tscn")
