extends Control

func _ready() -> void:
	Global.num_rounds += 1
	Global._quota_cal()
	
	var path_one = randi_range(1,2)
	var path_two = randi_range(1,2)
	
	if path_one == 1: 
		$Paths/Button.text = str("Gamble")
		$Paths/Button.pressed.connect(_to_loot)
	elif path_one == 2:
		$Paths/Button.text = str("Shop")
		$Paths/Button.pressed.connect(_to_shop)
	
	if path_two == 1: 
		$Paths/Button2.text = str("Gamble")
		$Paths/Button2.pressed.connect(_to_loot)
	elif path_two == 2:
		$Paths/Button2.text = str("Shop")
		$Paths/Button2.pressed.connect(_to_shop)

func _to_loot():
	get_tree().change_scene_to_file("res://Scenes/loot!.tscn")

func _to_shop():
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")
