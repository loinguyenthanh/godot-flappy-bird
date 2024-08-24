extends Node

@onready var ground = $"../Ground" as Ground
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var bird = $"../Bird" as Bird
@onready var label = $"../Label"
@onready var ui = $"../UI" as UI

var point = 0

var is_end_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	bird.start_game.connect(start_game)
	pipe_spawner.bird_cashed.connect(stop_game)
	pipe_spawner.scored.connect(add_point)
	ground.bird_cashed.connect(stop_game)
	pass # Replace with function body.

func start_game():
	point = 0
	pipe_spawner.start_spawn_timer()
	pass

func stop_game():
	is_end_game = true
	ground.stop()
	pipe_spawner.stop()
	bird.kill()
	ui.on_game_over()
	pass

func add_point():
	point += 1
	label.text = "%d" % point
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump") && is_end_game:
		await get_tree().create_timer(0.6).timeout 
		get_tree().reload_current_scene()
	pass
