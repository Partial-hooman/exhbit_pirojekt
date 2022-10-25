extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate = Color(1,0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(rand_range(-2.0,2.0),rand_range(-2.0, 2.0))
	var collision = move_and_collide(Vector2(rand_range(-2.0,2.0),rand_range(-2.0, 2.0)) * delta)
	if collision:
		if "cell" in collision.collider.name:
			pass
