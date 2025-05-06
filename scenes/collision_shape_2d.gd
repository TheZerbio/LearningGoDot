extends CollisionShape2D
@onready var platform = $".."

func _physics_process(delta):
	self.one_way_collision=platform.get_meta("one_way")
