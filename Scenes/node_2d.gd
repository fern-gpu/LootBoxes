extends Node2D
func ready():
	var loot = Global.loot_open(1)
	for item in loot:
		var sprite = Sprite2D.new()
		sprite.texture = item.icon
		sprite.set_script(item.item_script)
		get_tree().current_scene.add_child(sprite)
	#$Description.text = Array[Loot].description
	#$Title.text = Array[Loot].name I don't know how to do this mb
	
