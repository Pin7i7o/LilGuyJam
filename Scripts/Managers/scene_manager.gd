extends Node

var scenes: Dictionary = {	"level_1": "res://Scenes/Levels/level.tscn",
							"boss": "res://Scenes/Levels/boss.tscn",
							"death_game_over": "res://Scenes/UI/death_game_over.tscn",
							"main_menu": "res://Scenes/UI/main_menu.tscn",
							"end_game_over": "res://Scenes/UI/end_game_over.tscn"
						}


func transisiton_scene(scene: String, add_timer: bool):
	var scene_path: String = scenes.get(scene)
	
	if scene_path:
		if add_timer:
			await get_tree().create_timer(1.0).timeout
		get_tree().call_deferred("change_scene_to_file", scene_path)
