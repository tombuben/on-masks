extends Parallax2D

@export var positions = 2

@onready var init_pos = position

func _process(_delta: float) -> void:
	var msec = Time.get_ticks_msec()
	@warning_ignore("integer_division") var index = (msec / 200) % positions
	position = init_pos + Vector2(index,index)
