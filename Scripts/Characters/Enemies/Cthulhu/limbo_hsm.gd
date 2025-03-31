extends LimboHSM
#State machine for the cthulhu enemy

@export var character: EnemyBoss

@export var states: Dictionary[String, LimboState]

func _ready() -> void:
	_bind_transitions()
	initialize(character)
	set_active(true)
	
func _bind_transitions():
	#Idle state transitions
	add_transition(states["idle"], states["slam"], "&toSlam")
	add_transition(states["idle"], states["worm"], "&toWorm")
	add_transition(states["idle"], states["turret"], "&toTurret")
	add_transition(states["idle"], states["death"], "&toDeath")
	
	#Slam state transitions
	add_transition(states["slam"], states["idle"], "&toIdle")
	
	#Worm state transitions
	add_transition(states["worm"], states["idle"], "&toIdle")
	
	#Turret state transitions
	add_transition(states["turret"], states["idle"], "&toIdle")
