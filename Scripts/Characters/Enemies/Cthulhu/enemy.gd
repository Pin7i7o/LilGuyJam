extends CharacterBody2D
class_name EnemyBoss

@export var stats: BossEnemyStats
@export var group_names: GroupNames
@export var enemy_phase: Array[StringName]
@export var animated_sprite_2d: AnimatedSprite2D
@export var hitbox: Area2D

var hp: float

var hand_scene: PackedScene = preload("res://Scenes/Characters/Enemy/hand.tscn")
var hand_parent: Node2D

func _ready() -> void:
	hp = stats.HP
	
	hand_parent = get_tree().get_first_node_in_group(group_names.hand_parent_node)
	assert(hand_parent != null, "No hand node found")
