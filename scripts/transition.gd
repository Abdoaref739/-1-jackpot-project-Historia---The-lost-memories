extends Control

func _on_transition_animation_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
	
