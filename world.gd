extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$GUI/Health.value = Global.health
	$GUI/Score.set_text(str(" Score: ", Global.score))
	if Global.enemieskilled == 3 and Global.score == 5:
		get_tree().change_scene_to_file("res://win.tscn")

