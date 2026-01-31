extends Area2D

@export var correct : bool
@onready var confirm_sprite = $"Confirm"

var list_counter : ListCounter
var selected = false

func _ready() -> void:
	var parent = get_parent()
	while parent is not ListCounter:
		parent = parent.get_parent()
	list_counter = parent

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and not selected:
		selected = true
		confirm_sprite.visible = true
		if correct:
			list_counter.number_selected += 1
		if list_counter.number_selected >= list_counter.target_count:
			list_counter.parent_panel.is_blocking = false
			
	elif event is InputEventMouseButton and event.is_pressed() and selected:
		selected = false
		confirm_sprite.visible = false
		if correct:
			list_counter.number_selected -= 1
		if list_counter.number_selected >= list_counter.target_count:
			list_counter.parent_panel.is_blocking = true
