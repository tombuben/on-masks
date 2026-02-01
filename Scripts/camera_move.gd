extends Camera2D

@export var positions : Array[ComicPanel]

var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for comicpanel in positions:
		modulate = Color	(1,1,1,0)
	
	global_position = positions[current_index].global_position
	await get_tree().process_frame
	go_to_panel(current_index)

func _input(event: InputEvent) -> void:
	if not positions[current_index].is_active:
		return
	if event.is_action_pressed("next"):
		if not positions[current_index].is_blocking:
			go_to_panel(current_index + 1)
		
	if event.is_action_pressed("back"):
		if positions[current_index].can_reverse:
			go_to_panel(current_index - 1)

func go_to_panel(panel_index):
	await positions[current_index].exit_panel()
	var tween = get_tree().create_tween().set_parallel(true)
	#tween the current panel visibility out
	tween.tween_property(positions[current_index], "modulate", Color(1,1,1,0), 0.5)
	current_index = panel_index
	current_index = current_index % len(positions)
	var next_position = positions[current_index].global_position
	tween.tween_property(self, "global_position", next_position, 1.0)
	#tween the next panel visibility in
	tween.tween_property(positions[current_index], "modulate", Color(1,1,1,1), 0.5)
	await tween.finished
	await positions[current_index].enter_panel()

	
