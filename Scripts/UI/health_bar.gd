extends Node2D

@export var full_heart: Texture2D
@export var empty_heart: Texture2D

@onready var heart_1: Sprite2D = $Heart1
@onready var heart_2: Sprite2D = $Heart2
@onready var heart_3: Sprite2D = $Heart3


func _ready() -> void:
	EventsManager.on_health_changed.connect(on_player_health_changed)

func on_player_health_changed(player_current_health: float):
	match player_current_health:
		2.0:
			heart_3.texture = empty_heart
		1.0:
			heart_2.texture = empty_heart
