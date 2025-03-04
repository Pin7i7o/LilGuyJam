extends CharacterBody2D

#state machine
@export var state_machine: LimboHSM

#states
@onready var idle_state: LimboState = $LimboHSM/idle_state
@onready var run_state: LimboState = $LimboHSM/run_state
@onready var jump_state: LimboState = $LimboHSM/jump_state

#movement variables
@export var SPEED = 300
@export var ACCELERATION = 50
@export var DECELERATION = 100

#jump variables
@export var DEFAULT_GRAVITY = 10
@export var JUMP = 300 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var prev_velocity = Vector2.ZERO
var movement_input = Vector2.ZERO

func _ready():
	_initialize_state_machine()
	
func _initialize_state_machine():
	state_machine.add_transition(idle_state, run_state, "&toMove")
	state_machine.add_transition(run_state, idle_state, "&toIdle")
	state_machine.add_transition(idle_state, jump_state, "&toJump")
	state_machine.add_transition(run_state, jump_state, "&toJump")

	
	state_machine.initial_state = idle_state
	state_machine.initialize(self)
	state_machine.set_active(true)

func _physics_process(_delta: float) -> void:
	set_gravity()
	
	movement_input = Input.get_vector("left", "right", "up", "down")
	
	if not is_on_floor():
		velocity.x = lerp(prev_velocity.x, velocity.x, 0.1)

	prev_velocity = velocity 
	move_and_slide()

func set_gravity() -> void:
		if not is_on_floor():
			velocity.y += DEFAULT_GRAVITY

func run() -> void:
	if movement_input.x != 0:
		velocity.x = move_toward(velocity.x, SPEED * movement_input.x, ACCELERATION)
	else :
		velocity.x = move_toward(velocity.x, 0, DECELERATION)

func update_sprite_direction():
	if movement_input.x != 0:
		animated_sprite_2d.flip_h = movement_input.x < 0

func check_jump() -> void:
	if Input.is_action_just_pressed("jump"):
		state_machine.dispatch("&toJump")

				
						 
