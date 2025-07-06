extends Control

@export var next_scene_path: String

func _on_timer_timeout() -> void:
	get_tree().call_deferred("change_scene_to_file", next_scene_path)
	
	
