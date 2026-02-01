extends Sprite2D

@export var ExpandedPosition : Node2D
@export var initial_size : float = 0.4

@onready var expansion : float = initial_size

@onready var orig_position = global_position
@onready var target_position = ExpandedPosition.global_position


var tween : Tween
var parent_panel : ComicPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent = get_parent()
	while parent is not ComicPanel:
		parent = parent.get_parent()
	parent_panel = parent
	
	tween = get_tree().create_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if parent_panel.is_active and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): # Left click
		expansion += delta * 0.5
	else:
		expansion -= delta * 0.5
		
	if expansion > 0.9:
		parent_panel.is_blocking = false
	
	expansion = clamp(expansion, initial_size, 1.0)
	material.set_shader_parameter("expansion", expansion)	
	var progress = remap(expansion, initial_size, 1.0, 0.0, 1.0)
	global_position = lerp(orig_position, target_position, progress)
