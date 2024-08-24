extends Node2D

class_name PipeSpawner

signal bird_cashed
signal scored


@onready var spawn_timer = $SpawnTimer

var pipe_pair_scene = preload("res://Scenes/pipe_pair.tscn")

const pipe_speed = -120

var is_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_spawn_timer():
	for pipe in get_children().filter(func (child): return child is PipePair):
		(pipe as PipePair).queue_free()
	spawn_timer.timeout.connect(spawner_pipe)
	spawn_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawner_pipe():
	var pipe = pipe_pair_scene.instantiate() as PipePair
	add_child(pipe)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
	
	var half_height = viewport_rect.size.y / 2

	pipe.position.y = randf_range(viewport_rect.size.y * 0.15 - half_height, viewport_rect.size.y * 0.60 - half_height
	)
	
	print("zxc")
	print(pipe.position.y)
	
	pipe.bird_entered.connect(on_bird_entered)
	pipe.scored_entered.connect(on_scored_entered)
	
	pipe.set_speed(pipe_speed)
	pass

func on_bird_entered():
	bird_cashed.emit()
	stop()
	
func on_scored_entered():
	scored.emit()
	
	
func stop():
	spawn_timer.stop()
	for pipe in get_children().filter(func (child): return child is PipePair):
		(pipe as PipePair).speed = 0
	pass
