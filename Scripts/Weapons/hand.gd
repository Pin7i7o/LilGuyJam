extends Area2D
class_name Hand

@onready var scout_timer: Timer = $ScoutTimer
@onready var scoutbox: Area2D = $Scoutbox
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

enum states {
	SCOUTING,
	SLAMING,
	CENTERING,
}

var state = states.SCOUTING

var initial_position: Vector2 = Vector2(576, 170)
var initial_position_distance_treshold: float = 5.0
var locked_target_position: Vector2 = Vector2.ZERO
var locked_target_position_treshold: float = 5.0
var target_body: Player
var smoothing_speed: float = 2.0

var slam_cooldown: float
var slam_downwards_speed: float
var slam_upwards_speed: float
var slam_downwards_speed_multiplier: float 

func _ready() -> void:
	global_position = initial_position

func _physics_process(_delta: float) -> void:
	match state:
		states.SCOUTING:
			if target_body:
				position.x = target_body.global_position.x
		
		states.SLAMING:
			var direction = (locked_target_position - global_position).normalized()
			var tracking_speed = slam_downwards_speed * slam_downwards_speed_multiplier
			position += direction * tracking_speed
		
			if global_position.distance_to(locked_target_position) <= locked_target_position_treshold:
				_on_slam_impact()
		
		states.CENTERING:
			if target_body:
				position.x = lerp(position.x, target_body.global_position.x, smoothing_speed * _delta)
					
				var y_distance = initial_position.y - global_position.y
				position.y += sign(y_distance) * slam_upwards_speed
				
				if abs(y_distance) <= initial_position_distance_treshold:
					_start_scout_cycle()
		
func _on_slam_impact() -> void:
	state = states.CENTERING
	collision_shape_2d.set_deferred("disabled", true)

func _start_scout_cycle() -> void:
	state = states.SCOUTING
	scoutbox.monitoring = true
	GlobalVariables.slam_counter += 1
	target_body = null
	collision_shape_2d.disabled = false

func _on_scoutbox_body_entered(body: Node2D) -> void:
	if body is Player:
		target_body = body
		scout_timer.start(slam_cooldown)
		scoutbox.set_deferred("monitoring", false)
		
func _on_scout_timer_timeout() -> void:
	if target_body:
		locked_target_position = target_body.global_position
		state = states.SLAMING

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body._die()
	
