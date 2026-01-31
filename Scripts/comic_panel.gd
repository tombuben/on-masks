class_name ComicPanel extends Node2D

@export var is_blocking : bool = false
@export var can_reverse : bool = false
@onready var player = $AnimationPlayer

var is_active : bool = false

func enter_panel():
	var enter_animation = name+"/Enter"
	var idle_animation = name+"/Idle"
	if (player.has_animation(enter_animation)):
		player.play(enter_animation)
		await player.animation_finished
		is_active = true
		if (player.has_animation(idle_animation)):
			player.queue(idle_animation)
	elif (player.has_animation(idle_animation)):
		is_active = true
		player.play(idle_animation)

func exit_panel():
	is_active = false
	var exit_animation = name+"/Exit"
	if (player.has_animation(exit_animation)):
		player.play(exit_animation)
		await player.animation_finished
