extends Node2D

@export var speed_move : float = 1

@export var speed_scale : float = 1
@export var noise : Noise

@onready var init_pos = position
@onready var random_seed = randi() % 10000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var seconds = float(Time.get_ticks_msec()) / 50.0
	var speed_sample = seconds * speed_move + random_seed
	position.x = init_pos.x + noise.get_noise_1d(speed_sample) * 100.
	position.y = init_pos.y + noise.get_noise_1d(speed_sample + 1000) * 100.
	
	var scale_sample = seconds * speed_scale + random_seed
	var scale_value = 1. + noise.get_noise_1d(scale_sample + 1140) * 0.2
	scale = Vector2(scale_value, scale_value)
