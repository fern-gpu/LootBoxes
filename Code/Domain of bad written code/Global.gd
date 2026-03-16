extends Node

var score = 0
var multipler = 1

var lootbox_items: Array[Loot]
var shop_items: Array[Loot]

func calculate_items():
	for items in [lootbox_items, shop_items]:
		var total_pop := 0
		
		# calculate total frequency for rating & collect frequency for choice (idk if this is the term but i know it works)
		for item in items:
			total_pop += item.frequency
			item.sum_frequency = total_pop
		
		# make this a float so that we can use float division instead of integer
		var avg_pop = float(total_pop) / len(items)
		# rate the items into their category
		# could use more tuning... this is a very naive way of going about sorting them
		for item in items:
			if item.frequency / avg_pop > 2.4:
				item.rating = "Common"
			elif item.frequency / avg_pop > 1.2:
				item.rating = "Uncommon"
			elif item.frequency / avg_pop > 0.6:
				item.rating = "Rare"
			else:
				item.rating = "Legendary"

func loot_open(num_items: int) -> Array[Loot]:
	var items: Array[Loot] = []
	for _i in range(num_items):
		var choice = randi() % lootbox_items[-1].sum_frequency
		for item in lootbox_items:
			if choice <= item.sum_frequency:
				items.append(item)
				break
	return items

# This took way to long (/-\)
