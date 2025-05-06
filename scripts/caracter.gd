extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var isDead:bool = false
var maxLife = 0
var curLife = 0

func _process(delta):
	maxLife = get_meta("maxHealth")
	curLife = get_meta("currentHealth")
	if curLife<0:
		isDead=true

func _physics_process(delta):
	# Add the gravity.$"."
	if not isDead:
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction == 1:
			animated_sprite_2d.play("running")
			animated_sprite_2d.flip_h=0
			velocity.x = direction * SPEED
		if direction == -1:
			animated_sprite_2d.play("running")
			animated_sprite_2d.flip_h=1
			velocity.x = direction * SPEED
		if direction == 0:
			animated_sprite_2d.play("default")
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
