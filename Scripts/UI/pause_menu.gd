extends CanvasLayer


func _on_continue_pressed() -> void:
	GameManager.continue_game()
	queue_free()

func _on_exit_pressed() -> void:
	GameManager.exit_game()
