extends Area2D

@export var next_scene_path: String

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		change_scene()
		
func change_scene():
	## da error de fisicas -> get_tree().change_scene_to_file(next_scene_path)
	get_tree().call_deferred("change_scene_to_file", next_scene_path)
