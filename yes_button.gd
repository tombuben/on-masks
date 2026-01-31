extends Area2D

var parent_panel : ComicPanel

@export var shake_amount : float = 0.5
@onready var original_position = position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent = get_parent()
	while parent is not ComicPanel:
		parent = parent.get_parent()
	parent_panel = parent
	
func _process(delta: float) -> void:
	position = original_position + Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
	pass
	
# Called when the node enters the scene tree for the first time.
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		parent_panel.player.play("Panel3/YesRunAway")
		parent_panel.is_blocking = false
	
