extends CharacterBody2D

@export var SPEED = 300
@export var ACCELERATION = 50
@export var DECELERATION = 100

@export var GRAVITY = 10
@export var JUMP = 300 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	set_gravity()
	
	var direction: float = input()
	
	if direction != 0:
		accelerate(direction)
	else:
		decelerate()
		#set state and anim
		
	flip_sprite(direction)
	player_movement()
	jump()

func set_gravity() -> void:
		if not is_on_floor():
			velocity.y += GRAVITY

func input() -> float:
	var direction = 0
	
	direction = Input.get_axis("left", "right")
	return direction
	
func accelerate(direction) -> void:
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION)

func decelerate() -> void:
	velocity.x = move_toward(velocity.x, 0, DECELERATION)
	
func flip_sprite(direction: float) -> void:
	if direction == 1:
		animated_sprite_2d.flip_h = false
	elif direction == -1:
		animated_sprite_2d.flip_h = true
	
func player_movement() -> void:
	move_and_slide()

func jump() -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y -= JUMP                                  
