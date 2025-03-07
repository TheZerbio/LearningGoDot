extends Node2D

@onready var area_2d = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.has_meta("isPlayer"):
			print_debug("Player Collision detected")
		else:
			print_debug("Char2D collision detected")
