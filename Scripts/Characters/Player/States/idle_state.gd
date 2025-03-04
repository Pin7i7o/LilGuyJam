extends LimboState

@export var animation_name: StringName
@export var animated_sprite_2d: AnimatedSprite2D


func _enter() -> void:
	agent.velocity.x = 0
	animated_sprite_2d.play(animation_name)
	
func _update(_delta: float) -> void:
	agent.check_jump()
	if agent.movement_input != Vector2.ZERO:
		get_root().dispatch("&toMove")
