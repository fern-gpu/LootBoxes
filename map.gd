extends Control
var path_one = randi_range(1,2)
var path_two = randi_range(1,2)
func _ready() -> void:
	if path_one == 1: $Paths/Button.text = str("Gamble")
	elif path_one == 2: $Paths/Button.text = str("Shop")
	
	if path_two == 1: $Paths/Button2.text = str("Gamble")
	elif path_two == 2: $Paths/Button2.text = str("Shop")
func _on_button_2_pressed() -> void:
	if path_two == 1:
		get_tree().change_scene_to_file("res://Scenes/loot!.tscn")
	elif path_two == 2:
		get_tree().change_scene_to_file("res://Scenes/shop.tscn")
func _on_button_pressed() -> void:
	if path_one == 1:
		get_tree().change_scene_to_file("res://Scenes/loot!.tscn")
	elif path_one == 2:
		get_tree().change_scene_to_file("res://Scenes/shop.tscn")
