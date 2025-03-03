extends CharacterBody2D

@export var SPEED = 300
@export var ACCELERATION = 50
@export var DECELERATION = 100

@export var GRAVITY = 10
@export var JUMP = 300 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var prev_velocity = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	set_gravity()
	
	var direction = Input.get_axis("left", "right")
	
	run(direction)
	
	jump()
	if not is_on_floor():
		velocity.x = lerp(prev_velocity.x, velocity.x, 0.1)

	prev_velocity = velocity 
	move_and_slide()


func set_gravity() -> void:
		if not is_on_floor():
			velocity.y += GRAVITY

func run(direction) -> void:
	if direction != 0:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION)
		animated_sprite_2d.flip_h = direction < 0
	else :
		velocity.x = move_toward(velocity.x, 0, DECELERATION)

func jump() -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y -= JUMP                          
