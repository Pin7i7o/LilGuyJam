extends Area2D
class_name Projectile

@onready var scout_timer: Timer = $Timers/ScoutTimer
@onready var lifetime: Timer = $Timers/Lifetime

@onready var atkbox: Area2D = $Atkbox
@onready var atkbox_collision_shape_2d: CollisionShape2D = $Atkbox/CollisionShape2D

@onready var hurtbox: Area2D = $Hurtbox

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

@onready var explosion_particles: GPUParticles2D = $GPUParticles2D
@onready var sfx_explosion: AudioStreamPlayer2D = $Explosion

var reached_max_height: bool = false
var is_scouting: bool = false
var locked_target_position: Vector2 = Vector2.ZERO
var reached_target_position: bool = false
var target_distance_treshold: float = 5.0

var projectile_speed: float
var projectile_speed_multiplier: float
var projectile_max_height: float

func _ready() -> void:
	sprite_2d.play("default")

func _physics_process(_delta: float) -> void:
	if !reached_max_height:
		position -= transform.y * projectile_speed
		
		if position.y <= projectile_max_height:
			_reached_max_height()

	elif !is_scouting:
		if !locked_target_position.is_equal_approx(Vector2.ZERO) && !reached_target_position:
			var direction = (locked_target_position - global_position).normalized()
			var tracking_speed = projectile_speed * projectile_speed_multiplier
			position += direction * tracking_speed
			
			if global_position.distance_to(locked_target_position) <= target_distance_treshold:
				_reached_target_position()
				
			
func _reached_max_height() -> void:
	reached_max_height = true
	is_scouting = true
	atkbox.monitoring = true
	scout_timer.start(2.0)
	
func _reached_target_position() -> void:
	reached_target_position = true
	hurtbox.monitoring = true
	_spawn_explosion()

func _spawn_explosion() -> void:
	sprite_2d.visible = false
	explosion_particles.emitting = true
	sfx_explosion.play()
	lifetime.start(0.5)

func _on_lifetime_timeout() -> void:
	queue_free()

func _on_scout_timer_timeout() -> void:
	is_scouting = false
	atkbox.monitoring = false
	if locked_target_position.is_equal_approx(Vector2.ZERO):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body._die()
	queue_free()

func _on_atkbox_body_entered(body: Node2D) -> void:
	if body is Player:
		locked_target_position = body.global_position
		scout_timer.stop()
		is_scouting = false

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body._die()
