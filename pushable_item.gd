extends RigidBody2D

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		global_position += event.relative
