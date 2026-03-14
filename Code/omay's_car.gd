extends Node2D
var Number_of_Rares

func _ready() -> void:
	if Global and Global.items:
		Number_of_Rares = len(Global.items.get("Rare"))
		print(Number_of_Rares)
		for i in range(Number_of_Rares):
			Global.score += 100 * Global.multipler
			if Global.score >= 1000:
				Global.multipler += Number_of_Rares
			print(Global.score)
	else:
		print("Global or Global.items is not initialized")
		Number_of_Rares = 0  #
