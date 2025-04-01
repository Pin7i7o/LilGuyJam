extends Node

var pause_menu_screen: PackedScene = preload("res://Scenes/UI/pause_menu.tscn")

func start_game():
	if get_tree().paused:
		continue_game()
	
	SceneManager.transisiton_scene("level_1", true)

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
