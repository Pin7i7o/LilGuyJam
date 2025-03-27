extends Node2D
class_name Bullet

@onready var lifetime: Timer = $Lifetime

var projectile_speed: float

func _ready() -> void:
	lifetime.start(3.0)

func _physics_process(_delta: float) -> void:
	position += transform.x * projectile_speed

func _on_lifetime_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("bang")
