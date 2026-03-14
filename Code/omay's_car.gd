extends Node2D
var number_of_rares: int

func _ready() -> void:
	if Global and Global.items:
		number_of_rares = len(Global.items.get("Rare"))
		print(number_of_rares)
		for i in range(number_of_rares):
			Global.score += 100 * Global.multipler
			if Global.score >= 1000:
				Global.multipler += number_of_rares
			print(Global.score)
	else:
		print("Global or Global.items is not initialized")
		number_of_rares = 0  #
