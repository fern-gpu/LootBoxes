extends Node

var score = 0
var multipler = 1
var item_rate = ""
var lootbox_items: Array[Loot]
var shop_items: Array[Loot]
var quota = 0
var num_rounds = 0

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
			item_rate= item.rating


func loot_open(num_items: int) -> Array[Loot]:
	var items: Array[Loot] = []
	if lootbox_items.is_empty():
		return items
	
	var max_freq = lootbox_items.back().sum_frequency
	
	for _i in num_items:
		var choice = randi() % max_freq
		for item in lootbox_items:
			if choice <= item.sum_frequency:
				items.append(item)
				break
	
	return items

func _quota_cal():
	for i in range(num_rounds):
		quota = i * 100 * multipler

# (0-0) it's ... SIMPLE!!!
