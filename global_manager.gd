extends Node

var is_dragging = null

func _ready() -> void:
	get_viewport().physics_object_picking_first_only = true
	get_viewport().physics_object_picking_sort = true

func _input(event: InputEvent) -> void:
	if is_dragging and event is InputEventMouseMotion:
		is_dragging.velocity = event.velocity
	elif event is InputEventMouseButton and\
		event.is_released() and\
		event.button_index == MOUSE_BUTTON_LEFT:
		is_dragging = null
