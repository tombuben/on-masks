extends Area2D

var parent_panel : ComicPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent = get_parent()
	while parent is not ComicPanel:
		parent = parent.get_parent()
	parent_panel = parent

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		visible = false
		parent_panel.is_blocking = false
	
