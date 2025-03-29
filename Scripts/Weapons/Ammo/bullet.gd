extends Area2D
class_name Bullet

@onready var lifetime: Timer = $Lifetime

var bullet_speed: float

var max_pierce_count: float = 1.0
var curent_pierce_count: float = 0

func _physics_process(_delta: float) -> void:
	position += transform.x * bullet_speed
	
	if curent_pierce_count >= max_pierce_count:
			queue_free()

func _on_lifetime_timeout() -> void:
	queue_free()

func _on_body_entered(_body: Node2D) -> void:
	queue_free()
