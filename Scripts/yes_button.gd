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
	
func _process(_delta: float) -> void:
	position = original_position + Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
	pass
	
# Called when the node enters the scene tree for the first time.
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		parent_panel.player.play("YesRunAway")
		parent_panel.is_blocking = false
		await parent_panel.player.animation_finished
		queue_free()
	
