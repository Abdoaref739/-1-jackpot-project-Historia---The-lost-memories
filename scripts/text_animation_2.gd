extends AnimationPlayer
@onready var scene_text_1: RichTextLabel = $"../../scene text1"
@onready var timer_2: Timer = $"../../Timer2"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_text_animation_animation_finished(_anim_name: StringName) -> void:
	if timer_2.timeout:
		play("new_animation_2")
		scene_text_1.visible = false
