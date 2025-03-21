extends Node2D
class_name Projectile

@onready var timer: Timer = $Timer

var projectile_speed: float
var projectile_direction = Vector2.RIGHT

func _ready() -> void:
	timer.start()

func _process(_delta: float) -> void:
	position += transform.x * projectile_speed
	
	if timer.is_stopped():
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	pass
