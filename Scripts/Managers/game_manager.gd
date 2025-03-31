extends Node

var pause_menu_screen = preload("res://Scenes/UI/pause_menu.tscn")

func start_game():
	if get_tree().paused:
		continue_game()
	
	SceneManager.transisiton_scene("level_1")
		
func exit_game():
	get_tree().quit()

func continue_game():
	get_tree().paused = false

func pause_game():
	get_tree().paused = true
	
	var pause_menu_screen_instance = pause_menu_screen.instantiate()
	get_tree().get_root().add_child(pause_menu_screen_instance)
