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

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if not list_counter.parent_panel.is_active:
		return
	
	if event is InputEventMouseButton and event.is_pressed() and not selected:
		selected = true
		confirm_sprite.visible = true
		
		list_counter.number_selected += 1
		if correct:
			list_counter.number_correct_selected += 1
			
		var only_correct : bool = list_counter.number_selected == list_counter.number_correct_selected
		var all_correct_selected = list_counter.number_selected >= list_counter.target_count
		list_counter.parent_panel.is_blocking = not only_correct or not all_correct_selected

			
	elif event is InputEventMouseButton and event.is_pressed() and selected:
		selected = false
		confirm_sprite.visible = false
		
		list_counter.number_selected -= 1
		if correct:
			list_counter.number_correct_selected -= 1
	
		var only_correct : bool = list_counter.number_selected == list_counter.number_correct_selected
		var all_correct_selected = list_counter.number_selected >= list_counter.target_count
		list_counter.parent_panel.is_blocking = not only_correct or not all_correct_selected
