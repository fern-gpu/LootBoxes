extends Control
# Uh I made the cost thing so you knowwwww. (sorry)
var selected = 1

@onready var item_boxes: Array[Panel] = [$Item1, $Item2, $Item3]
@onready var inactive_stylebox := preload("res://Code/Effects/Styles/inactive_shop.tres")
@onready var active_stylebox := preload("res://Code/Effects/Styles/active_shop.tres")
var loots = []

func _ready() -> void:
	for i in range(3):
		var choice = randi() % Global.shop_items[-1].sum_frequency
		for item in Global.shop_items:
			if choice < item.sum_frequency:
				item_boxes[i].get_child(0).get_child(0).get_child(0).texture = item.icon
				item_boxes[i].get_child(0).get_child(0).get_child(1).text = item.description
				item_boxes[i].get_child(0).get_child(0).get_child(2).text = item.name
				
				loots.append(item)
				break

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		item_boxes[selected].add_theme_stylebox_override("panel", inactive_stylebox)
		selected -= 1
		if selected == -1:
			selected = 2
		item_boxes[selected].add_theme_stylebox_override("panel", active_stylebox)
	if Input.is_action_just_pressed("ui_right"):
		item_boxes[selected].add_theme_stylebox_override("panel", inactive_stylebox)
		selected += 1
		if selected == 3:
			selected = 0
		item_boxes[selected].add_theme_stylebox_override("panel", active_stylebox)
	if Input.is_action_just_pressed("ui_accept"):
		var sprite = Sprite2D.new()
		sprite.texture = loots[selected].icon
		sprite.set_script(loots[selected].item_script)
		get_tree().current_scene.add_child(sprite)
		get_tree().change_scene_to_file("res://Scenes/map.tscn")
