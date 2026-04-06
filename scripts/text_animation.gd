extends AnimationPlayer
@onready var timer: Timer = $"../Timer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	if timer.timeout:
		play("text animation")
