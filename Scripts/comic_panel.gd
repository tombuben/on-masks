class_name ComicPanel extends Node2D

@export var is_blocking : bool = false
@export var arrow_next : Node2D
@export var can_reverse : bool = false
@export var arrow_back : Node2D
@export var player : AnimationPlayer

var is_active : bool = false

func enter_panel():
	var enter_animation = "Enter"
	var idle_animation = "Idle"
	if (player.has_animation(enter_animation)):
		player.play(enter_animation)
		await player.animation_finished
		if (player.has_animation(idle_animation)):
			player.queue(idle_animation)
	elif (player.has_animation(idle_animation)):
		player.play(idle_animation)	
	is_active = true

func exit_panel():
	is_active = false
	var exit_animation = "Exit"
	if (player.has_animation(exit_animation)):
		player.play(exit_animation)
		await player.animation_finished

func _process(_delta: float) -> void:
	if arrow_next:
		arrow_next.visible = is_active and not is_blocking
	if arrow_back:
		arrow_back.visible = is_active and can_reverse
