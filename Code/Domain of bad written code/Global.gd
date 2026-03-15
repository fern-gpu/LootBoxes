extends Node

var score = 0
var multipler = 1

var items: Array[Loot]

func loot_open(num_items: int):
	for _i in range(num_items):
		var choice = randi() % items[-1].sum_frequency
		for item in items:
			if choice <= item.sum_frequency:
				var item_made = item.icon.instantiate()
				item_made.set_script(item.item_script)
				get_tree().current_scene.add_child(item_made)
				return

# This took way to long (/-\)
