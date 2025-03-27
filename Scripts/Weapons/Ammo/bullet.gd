extends Node2D
class_name Bullet

@onready var lifetime: Timer = $Lifetime

var bullet_speed: float
var max_pierce_count: float = 1.0

var curent_pierce_count: float = 0

func _ready() -> void:
	lifetime.start(3.0)

func _physics_process(_delta: float) -> void:
	position += transform.x * bullet_speed

func _on_lifetime_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	curent_pierce_count += 1
	print("bang")
	if curent_pierce_count >= max_pierce_count:
		queue_free()
