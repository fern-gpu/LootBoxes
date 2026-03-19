extends TextureButton

func _on_pressed() -> void:
	var loot = Global.loot_open(1)
	
	for item in loot:
		var sprite = Sprite2D.new()
		sprite.texture = item.icon
		sprite.set_script(item.item_script)
		get_tree().current_scene.add_child(sprite)
		sprite.position = Vector2(240, 32)
		#It displays the item
		$"../Description".text = "[center]" + item.description
		$"../Title".text = "[center][rate]" + item.name + "[/rate]"

func _process(delta: float) -> void:
	$"../Score".text = "[rainbow]" + str(Global.score) + "[/rainbow]/" + str(Global.quota)
	if Global.score >= Global.quota:
		print("win")
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
	else: print("lose")
