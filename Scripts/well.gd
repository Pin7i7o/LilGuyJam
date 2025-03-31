extends Node2D
class_name Well


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.queue_free()
	
	await  get_tree().create_timer(2.0).timeout
	SceneManager.transisiton_scene("boss")
