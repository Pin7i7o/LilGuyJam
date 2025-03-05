extends LimboHSM
#State machine for the player

@export var character: CharacterBody2D

@export var states: Dictionary[String, LimboState]

func _ready() -> void:
	_bind_transitions()
	initialize(character)
	set_active(true)
	
func _bind_transitions():
	add_transition(states["ground"], states["air"], "&toAir")
	add_transition(states["air"], states["ground"], "&toGround")
