extends LimboState
class_name WormStateManager

@export var animation_name: StringName

var enemy_stats: WormEnemyStats

var right_ground_ray: RayCast2D
var left_ground_ray: RayCast2D
var wall_ray: RayCast2D
var vision_cone_ray: RayCast2D

var direction: Vector2

func _enter() -> void:
	agent.animated_sprite_2d.play(animation_name)
	
	enemy_stats = agent.stats
	right_ground_ray = agent.right_ground_ray
	left_ground_ray = agent.left_ground_ray
	wall_ray = agent.wall_ray
	vision_cone_ray = agent.vision_cone_ray
	
	direction = Vector2.RIGHT

func _change_direction() -> void:
	direction.x = -direction.x
	wall_ray.position.x = -wall_ray.position.x 
	wall_ray.rotation_degrees += 180

func _patrol() -> void:
	agent.velocity.x = move_toward(agent.velocity.x, enemy_stats.SPEED * direction.x, enemy_stats.ACCELERATION)
	agent.move_and_slide()
	
func _pursuit() -> void:
	print("pursuiting")
