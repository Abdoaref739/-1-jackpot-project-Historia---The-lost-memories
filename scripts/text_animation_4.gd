extends AnimationPlayer
@onready var scene_text_3: RichTextLabel = $"../../scene text3"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_text_animation_3_animation_finished(anim_name: StringName) -> void:
	play("text animation_4")
	scene_text_3.visible = false
