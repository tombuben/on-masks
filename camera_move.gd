extends Camera2D

@export var positions : Array[Node2D]
var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = positions[current_index].global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next"):
		current_index += 1
		current_index = current_index % len(positions)
		var next_position = positions[current_index].global_position
		var tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", next_position, 1.0)
