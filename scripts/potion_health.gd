extends Node2D

@export var heal_amount:float = 50
@onready var collectible = $Collectible
var full_scale_heal = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_scale= Vector2(heal_amount/full_scale_heal,heal_amount/full_scale_heal)
	if get_meta("debug"):
		print_debug("Poition scale: " + str(scale)) # Automaticly scales Potion relativly to healing amount	
	apply_scale(new_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_collectible_collected(body):
	print_debug("Recieved Signal")
	if body.has_meta("isPlayer") and (body.get_meta("isPlayer") == true):
		var curH =body.get_meta("currentHealth")
		var maxH =body.get_meta("maxHealth") 
		print_debug(str(curH)+"/"+str(maxH) )#print Health
		curH+=heal_amount
		if(curH>maxH):
			curH=maxH
		body.set_meta("currentHealth",curH)
		print_debug("Healing done. new health:"+str(body.get_meta("currentHealth")))
