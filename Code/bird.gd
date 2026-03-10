extends Node2D
#Pls replace the art and name

func _ready() -> void:
	# I feel like this is easy to understand so I wont explain it.
	for i in randi_range(1,10):
		Global.score += 100 * Global.multipler
		if i == 10:
			Global.multipler += 1



func _on_timer_timeout() -> void:
		queue_free()
