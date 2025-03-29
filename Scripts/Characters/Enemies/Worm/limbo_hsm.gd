extends LimboHSM
#State machine for the worm enemy

@export var character: EnemyWorm

@export var states: Dictionary[String, LimboState]

func _ready() -> void:
	_bind_transitions()
	initialize(character)
	set_active(true)
	
func _bind_transitions():
	#Patrol state transitions
	add_transition(states["patrol"], states["attack"], "&toAtk")
	
	#Attack state transitions
	add_transition(states["attack"], states["patrol"], "&toPatrol")
