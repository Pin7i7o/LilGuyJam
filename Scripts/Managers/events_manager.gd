extends Node

var slam_counter: float = 0.0

var lives: float = 3.0

signal  on_health_changed

func increase_slam_counter() -> void:
	slam_counter += 1

func get_slam_counter() -> float:
	return slam_counter

func set_slam_counter(new_count: float) -> void:
	slam_counter = new_count

func decrease_lives() -> void:
	if lives > 1.0:
		lives -= 1
		
	else:
		die()
	
	on_health_changed.emit(lives)

func die() -> void:
	SceneManager.transisiton_scene("death_game_over", false)
