extends Timer


func _on_lootbox_pressed() -> void:
	$".".start()


func _on_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/map.tscn")
