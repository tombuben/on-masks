extends CharacterBody2D

@export var drag_speed: float = 10.0  # Adjust for snappier/smoother dragging
var is_dragging: bool = false
var drag_offset: Vector2  # Distance from grab point to body center

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():  # Left mouse click (remap if needed)
			var space_state = get_world_2d().direct_space_state
			var mouse_pos = get_global_mouse_position()
			
			var params = PhysicsPointQueryParameters2D.new()
			params.position = mouse_pos
			params.collision_mask = collision_layer  # Match your body's layer

			var results = space_state.intersect_point(params)
			if len(results) > 0 and results[0].collider == self:
				is_dragging = true
				drag_offset = global_position - get_global_mouse_position()
		elif event.is_released():
			is_dragging = false

func _physics_process(delta):
	if is_dragging:
		var target_pos = get_global_mouse_position() + drag_offset
		velocity = (target_pos - global_position) * drag_speed
	else:
		velocity.x *= 0.9  # Optional damping when not dragging
		velocity.y *= 0.9
	
	move_and_slide()
