extends CanvasLayer

class_name UI

@onready var game_over_box = $MarginContainer/GameOverBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_game_over():
	game_over_box.visible = true
