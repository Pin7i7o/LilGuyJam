class_name PlayerStats
extends Resource
#Shared names for player stats

#movement variables
@export var SPEED: float = 300
@export var ACCELERATION: float = 50
@export var DECELERATION: float = 100

#jump variables
@export var DEFAULT_GRAVITY: float = 15000000000
@export var JUMP: float = 300
@export var MAX_JUMPS: int = 1

#air control variables
@export var AIR_ACCELERATION: float = 15
@export var AIR_FRICTION: float = 10
@export var GRAVITY_MULTIPLIER: float = 1.5
