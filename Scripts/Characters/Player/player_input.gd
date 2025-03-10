class_name PlayerInput
extends Node
#Handles receiving input and assigning values to the blackboard

@export var player_actions: PlayerActions
@export var limbo_hsm: LimboHSM

var blackboard: Blackboard
var input_direction: Vector2
var input_direction_history: Array = [Vector2(1,0)]
var history_cap: int = 2
var jump: bool
var attack: bool
var ult: bool

func _ready() -> void:
	blackboard = limbo_hsm.blackboard
	blackboard.bind_var_to_property(BBNames.direction_input, self, "input_direction", false)
	blackboard.bind_var_to_property(BBNames.jump_input, self, "jump", false)
	blackboard.bind_var_to_property(BBNames.attack_input, self, "attack", false)
	blackboard.bind_var_to_property(BBNames.ult_input, self, "ult", false)

func _process(_delta: float) -> void:
	#movement input
	input_direction = Input.get_vector(player_actions.move_left, player_actions.move_right, player_actions.move_up, player_actions.move_down)
	_add_to_history(input_direction)
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
		
	#ult input
	if Input.is_action_just_pressed(player_actions.ult):
		ult = true
	elif Input.is_action_just_released(player_actions.ult):
		ult = false


func _add_to_history(input: Vector2) -> void:
	if !input.is_zero_approx():
		input_direction_history.push_back(input)
		if input_direction_history.size() > history_cap:
			input_direction_history.pop_front()
