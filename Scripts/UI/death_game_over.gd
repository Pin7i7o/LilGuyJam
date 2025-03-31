extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start_game"):
		GameManager.back_to_title_screen()

	if event.is_action_pressed("pause"):
		GameManager.exit_game()
