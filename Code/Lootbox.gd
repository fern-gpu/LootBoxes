extends TextureButton
# The lootbox mainly need to be reworked to fit with the Arrays  as its only spawning the bird for some reason. 
var opened = false
func _on_pressed() -> void:
	opened = true
	var loot = Global.loot_open(1)
	$"scene_change timer".start()
	
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
	if opened:
		$".".disabled = true
	$"../Score".text = "[rainbow]" + str(Global.score) + "[/rainbow]/" + str(Global.quota)
	if Global.score >= Global.quota:
		Global.coins = Global.score / 10
		print(Global.coins) 
	else: 
		Global.coins -= 10

func _on_timer_timeout() -> void:
	Global.score = 0
