extends Node2D


func _on_text_animation_5_animation_finished(anim_name: StringName) -> void:
	if anim_name == "text animation_5":
		get_tree().change_scene_to_file("res://scenes/menu_transition.tscn")
