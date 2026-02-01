extends Sprite2D

@export var textures : Array[Texture2D]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var msec = Time.get_ticks_msec()
	@warning_ignore("integer_division") var index = (msec / 200) % len(textures)
	texture = textures[index]
