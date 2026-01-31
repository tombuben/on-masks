extends Sprite2D

@export var ExpandedPosition : Node2D
@export var initial_size : float = 0.4

@onready var expansion : float = initial_size

@onready var orig_position = global_position
@onready var target_position = ExpandedPosition.global_position
var tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	tween = get_tree().create_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed( 1 ): # Left click
		expansion += delta * 0.5
	else:
		expansion -= delta * 0.5
	
	expansion = clamp(expansion, initial_size, 1.0)
	material.set_shader_parameter("expansion", expansion)	
	var progress = remap(expansion, initial_size, 1.0, 0.0, 1.0)
	global_position = lerp(orig_position, target_position, progress)
