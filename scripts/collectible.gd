extends Node2D

signal collected(body:Node2D)
signal done


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_player_entered(body):
	if get_meta("debug"):	
		print("Player interacted with Collectiable")
	collected.emit(body)
	get_parent().queue_free() #Deletes itself and the Parent in the next frame
