extends Area2D

@export var action_name : String
@onready var sprite = $Sprite2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if sprite:
			var tween = get_tree().create_tween()
			tween.tween_property($Sprite2D, "position", Vector2(0,10), 0.1)
			tween.chain().tween_property($Sprite2D, "position", Vector2(0,0), 0.1)
			await tween.finished
		var cancel_event = InputEventAction.new()
		cancel_event.action = action_name
		cancel_event.pressed = true
		Input.parse_input_event(cancel_event)
