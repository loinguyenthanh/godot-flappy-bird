extends Node2D

class_name PipePair

var speed = -70
signal bird_entered
signal scored_entered

var is_showx = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_speed(data):
	speed = data

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	pass

func _on_body_entered(body):
	bird_entered.emit()
	pass # Replace with function body.

func _on_scored_body_exited(body):
	scored_entered.emit()
	pass # Replace with function body.

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
