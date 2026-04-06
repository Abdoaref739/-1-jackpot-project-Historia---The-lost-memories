extends AnimationPlayer
@onready var scene_text_2: RichTextLabel = $"../../scene text2"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_text_animation_2_animation_finished(_anim_name: StringName) -> void:
	play("text animation_3")
	scene_text_2.visible = false
