extends Node2D
var number_of_rares := 0

func _ready() -> void:
	if Global and Global.lootbox_items:
		for item in Global.lootbox_items:
			if item.rating == "Rare":
				number_of_rares += 1
		print(number_of_rares)
		for i in range(number_of_rares):
			Global.score += 100 * Global.multipler
			if Global.score >= 1000:
				Global.multipler += number_of_rares
			print(Global.score)
	else:
		print("Global or Global.lootbox_items is not initialized")
		number_of_rares = 0  #
