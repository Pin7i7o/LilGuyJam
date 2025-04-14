extends Node

var pause_menu_screen: PackedScene = preload("res://Scenes/UI/pause_menu.tscn")

func start_game():
	EventsManager.set_lives_count(3.0)
	EventsManager.set_slam_counter(3.0)
	SceneManager.transisiton_scene("level_1", false)

func back_to_title_screen():
	SceneManager.transisiton_scene("main_menu", true)

func finish_game():
	SceneManager.transisiton_scene("end_game_over", true)

func exit_game():
	get_tree().quit()

func continue_game():
	get_tree().paused = false

func pause_game():
	get_tree().paused = true
	
	var pause_menu_screen_instance = pause_menu_screen.instantiate()
	get_tree().get_root().add_child(pause_menu_screen_instance)
