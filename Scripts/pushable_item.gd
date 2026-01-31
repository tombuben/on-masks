extends CharacterBody2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		velocity = event.screen_relative

func _physics_process(_delta: float) -> void:
	velocity *= 0.9
	move_and_slide()
