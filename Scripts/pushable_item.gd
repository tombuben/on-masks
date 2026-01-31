extends CharacterBody2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	#if event is InputEventMouseMotion:
	#	velocity = event.screen_relative
	
	if event is InputEventMouseButton and\
	event.is_pressed() and\
	event.button_index == MOUSE_BUTTON_LEFT and\
	not GlobalManager.is_dragging:
		print("start drag")
		GlobalManager.is_dragging = self
		get_viewport().set_input_as_handled()


func _physics_process(_delta: float) -> void:
	velocity *= 0.9
	move_and_slide()
