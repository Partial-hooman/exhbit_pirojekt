extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var random  = RandomNumberGenerator.new()
var random1  = RandomNumberGenerator.new()



onready var cell = preload("res://cell.tscn")
onready var virus = preload("res://virus.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn(690)
	_spawn_virus(50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _spawn(num):
	random.randomize()
	for x in range(num):
		var inst = cell.instance()
		inst.position = Vector2(random.randi_range(0,-376), random.randi_range(0,-200))
		add_child(inst)

func _spawn_virus(num):
	random.randomize()
	for x in range(num):
		var vi_inst = virus.instance()
		vi_inst.position = Vector2(random.randi_range(0,-376), random.randi_range(0,-200))
		add_child(vi_inst)
