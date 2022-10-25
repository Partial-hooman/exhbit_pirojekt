extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = get_node("Timer")
onready var virus_spawn = preload("res://virus.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(4)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(rand_range(-0.5,0.5),rand_range(-0.5, 0.5))
	var collision = move_and_collide(Vector2(rand_range(-2.0,2.0),rand_range(-2.0, 2.0)) * delta)
	if collision:
		if "virus" in collision.collider.name:
			collision.collider.queue_free()
			$Sprite.modulate = Color.yellow
			timer.start()

func _spawn_virus(num):
	for x in range(num):
		var vi_inst = virus_spawn.instance()
		vi_inst.position = self.position
		get_parent().add_child(vi_inst)
	self.queue_free()



func _on_Timer_timeout():
	_spawn_virus(10)


