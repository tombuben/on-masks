extends CharacterBody2D

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		velocity = event.screen_relative

func _physics_process(delta: float) -> void:
	move_and_slide()
