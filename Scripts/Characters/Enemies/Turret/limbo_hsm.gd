extends LimboHSM
#State machine for the turret enemy

@export var character: EnemyTurret

@export var states: Dictionary[String, LimboState]

func _ready() -> void:
	_bind_transitions()
	initialize(character)
	set_active(true)
	
func _bind_transitions():
	#Scout state transitions
	add_transition(states["scout"], states["attack"], "&toAtk")
	
	#Attack state transitions
	add_transition(states["attack"], states["scout"], "&toScout")
