extends LimboState

@export var animation_name: StringName
@export var animated_sprite_2d: AnimatedSprite2D

func _enter() -> void:
	animated_sprite_2d.play(animation_name)

func _update(_delta: float) -> void:
	agent.run()
	agent.update_sprite_direction()
	agent.check_jump()
	
	if agent.movement_input.x == 0:
		get_root().dispatch("&toIdle")
	
