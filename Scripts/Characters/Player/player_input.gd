class_name PlayerInput
extends Node
#Handles receiving input and assigning values to the blackboard

@export var player_actions: PlayerActions
@export var limbo_hsm: LimboHSM

var blackboard: Blackboard
var input_direction: Vector2
var jump: bool
var attack: bool

func _ready() -> void:
	blackboard = limbo_hsm.blackboard
	blackboard.bind_var_to_property(BBNames.direction_input, self, "input_direction", false)
	blackboard.bind_var_to_property(BBNames.jump_input, self, "jump", false)
	blackboard.bind_var_to_property(BBNames.attack_input, self, "attack", false)

func _process(_delta: float) -> void:
	#movement input
	input_direction = Input.get_vector(player_actions.move_left, player_actions.move_right, player_actions.move_up, player_actions.move_down)
	
	#jump input
	if Input.is_action_just_pressed(player_actions.jump):
		jump = true
	elif Input.is_action_just_released(player_actions.jump):
		jump = false
	
	#basic attack input
	if Input.is_action_pressed(player_actions.attack):
		attack = true
	elif Input.is_action_just_released(player_actions.attack):
		attack = false
	
