extends Node

@export var items: Array[Loot]

func _ready() -> void:
	var total_pop := 0
	
	# calculate total frequency for rating & collect frequency for choice (idk if this is the term but i know it works)
	for item in items:
		total_pop += item.frequency
		item.sum_frequency = total_pop
	
	# make this a float so that we can use float division instead of integer
	var avg_pop = float(total_pop) / len(items)
	# rate the items into their category
	for item in items:
		if item.frequency / avg_pop > 2.4:
			item.rating = "Common"
		elif item.frequency / avg_pop > 1.2:
			item.rating = "Uncommon"
		elif item.frequency / avg_pop > 0.6:
			item.rating = "Rare"
		else:
			item.rating = "Legendary"
	
	Global.items = items
	
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
