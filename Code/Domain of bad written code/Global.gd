extends Node

var score = 0
var multipler = 1

# Spawns items. Please replace the items with the scene.
@onready var items = {
	"Common": [preload("res://LootBoxes/Scenes/items/bird.tscn")], 
	"Rare": [preload("res://LootBoxes/Scenes/items/bird.tscn")],
	"Epic": [preload("res://LootBoxes/Scenes/items/bird.tscn")],
	"Legendary": [preload("res://LootBoxes/Scenes/items/bird.tscn"),preload("res://LootBoxes/R-items/omay's_car.tscn")]
}

# type of rarity
var type = {
	"Common": 1000,
	"Rare": 500,
	"Epic": 250,
	"Legendary": 100  
}

func spawn(type_name):
	# Check if the type_name exists in items
	if not items.has(type_name):
		print("Error: Type ", type_name, " not found in items")
		return 
	
	var list_of_stuff = items[type_name]
	var random_index = randi() % list_of_stuff.size()
	var selected_scene = list_of_stuff[random_index]
	
	if selected_scene is PackedScene:
		var item_made = selected_scene.instantiate()
		get_tree().current_scene.add_child(item_made)
	else:
		print("Error: Selected item is not a valid scene")

func loot_open():
	var total_weight = 0 
	for weight in type.values():
		total_weight += weight
	
	var rand = randi() % total_weight
	var current_sum = 0
	
	# What rarity you get
	for rarity in type:  
		current_sum += type[rarity]
		if rand < current_sum:
			spawn(rarity)  
			return  




# This took way to long (/-\)
