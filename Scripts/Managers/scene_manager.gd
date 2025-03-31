extends Node

var scenes: Dictionary = {	"level_1": "res://Scenes/Levels/level.tscn",
							"boss": "res://Scenes/Levels/boss.tscn"
	}


func transisiton_scene(level: String):
	var scene_path: String = scenes.get(level)
	
	if scene_path:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file(scene_path)
