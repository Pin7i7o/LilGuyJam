extends CharacterBody2D
class_name EnemyTurret

@export var stats: TurretEnemyStats
@export var group_names: GroupNames
@export var animated_sprite_2d: AnimatedSprite2D
@export var upgrades_array: Array[BaseBulletStrategy]
@export var marker_2d: Marker2D
@export var attack_cd: Timer

@onready var attackbox: CollisionShape2D = $Atkbox/CollisionShape2D

var gravity: float = 12.0
var hp: float

var upgrade_scene: PackedScene = preload("res://Scenes/Weapons/Upgrades/upgrade.tscn")
var upgrades_parent: Node2D

var projectile_scene: PackedScene = preload("res://Scenes/Weapons/projectile.tscn")
var projectile_parent: Node2D

func _ready() -> void:
	hp = stats.HP
	attackbox.shape.radius = stats.ATTACK_RANGE
	
	upgrades_parent = get_tree().get_first_node_in_group(group_names.upgrades_parent_node)
	assert(upgrades_parent != null, "No upgrades node found")
	
	projectile_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_node)
	assert(projectile_parent != null, "No projectiles node found")

func _physics_process(_delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()

func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	print("Entered")

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	print("Exited")
