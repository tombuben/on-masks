extends Sprite2D

@export var speed : int = 100
@export var textures : Array[Texture2D]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var msec = Time.get_ticks_msec()
	var index = (msec / 100) % len(textures)
	texture = textures[index]
