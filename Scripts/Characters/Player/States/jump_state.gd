extends LimboState

@export var animation_name: StringName
@export var animated_sprite_2d: AnimatedSprite2D

func _enter() -> void:
	animated_sprite_2d.play(animation_name)
	agent.velocity.y -= agent.JUMP
