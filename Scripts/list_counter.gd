class_name ListCounter extends Node2D

@export var target_count : int = 4

var number_correct_selected = 0
var number_selected = 0
var parent_panel : ComicPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent = get_parent()
	while parent is not ComicPanel:
		parent = parent.get_parent()
	parent_panel = parent
	
