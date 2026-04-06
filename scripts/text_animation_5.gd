extends AnimationPlayer
@onready var scene_text_4: RichTextLabel = $"../../scene text4"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_text_animation_4_animation_finished(anim_name: StringName) -> void:
	play("text animation_5")
	scene_text_4.visible = false
	
