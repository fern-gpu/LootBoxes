extends TextureButton

func _on_pressed() -> void:
	# It should Spawn the item though it doesn't work.
	var loot = Global.loot_open(1)
	
	for item in loot:
		var sprite = Sprite2D.new()
		sprite.texture = item.icon
		sprite.set_script(item.item_script)
		get_tree().current_scene.add_child(sprite)
		#It displays the item
		$Description.text = "[rate]" + item.description + "[/rate]\n"
		$Title.text = item.name
		$"../Score".text += "[rainbow]"+Global.score+"[/rainbow]" + Global.quota

func _process(delta: float) -> void:
	if Global.score == Global.quota:
		print("win")
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
	else: print("lose")
