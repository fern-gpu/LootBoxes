@tool
extends RichTextEffect
class_name RateItem

var rating = Global.item_rate
var bbcode = "rate"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:

	if rating == "Common":
		char_fx.color = Color(0.33,0.,0)
		char_fx.offset.y = 0.5 * sin(char_fx.elapsed_time * 10 + char_fx.relative_index)

	elif rating == "Rare":
		char_fx.color = Color(0.2,0.5,0.457)
		char_fx.offset.y = 5 * sin(char_fx.elapsed_time * 10 + char_fx.relative_index)

	elif rating == "Epic":
		char_fx.color = Color(0.59,0.2,0.6)
		char_fx.offset.y = 10 * sin(char_fx.elapsed_time * 20 + char_fx.relative_index)

	elif rating == "Legendary":
		char_fx.color = Color(0.92,0.81,0.4)
		char_fx.offset.y = 20 * sin(char_fx.elapsed_time * 40 + char_fx.relative_index)

	else:
		char_fx.offset.y = 0.25 * sin(char_fx.elapsed_time * 5 + char_fx.relative_index)

	return true
