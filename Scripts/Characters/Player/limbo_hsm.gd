extends LimboHSM
#State machine for the player

@export var character: CharacterBody2D

@export var states: Dictionary[String, LimboState]

func _ready() -> void:
	_bind_transitions()
	initialize(character)
	set_active(true)
	
func _bind_transitions():
	#Ground state transitions
	add_transition(states["ground"], states["air"], "&toAir")
	add_transition(states["ground"], states["ground_atk"], "&toAtk")
	
	#Air state transitions
	add_transition(states["air"], states["ground"], "&toGround")
	add_transition(states["air"], states["air_atk"], "&toAtk")
	
	#Ground Attack state transitions
	add_transition(states["ground_atk"], states["ground"], "&toGround")
	add_transition(states["ground_atk"], states["air"], "&toAir")
	
	#Air Attack state transitions
	add_transition(states["air_atk"], states["ground"], "&toGround")
	add_transition(states["air_atk"], states["air"], "&toAir")
	
	#Ult state transitions
	add_transition(ANYSTATE, states["ult"], "&toUlt")
	add_transition(states["ult"], states["air"], "&toAir")
