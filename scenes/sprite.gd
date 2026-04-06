extends CharacterBody2D
#@onready var rich_text_label: RichTextLabel = $"../RichTextLabel"
@onready var camera_2d_2: Camera2D = $"../Camera2D2"
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var camera_2d_3: Camera2D = $"../Camera2D3"
@onready var camera_2d_4: Camera2D = $"../Camera2D4"
@onready var camera_2d_5: Camera2D = $"../Camera2D5"

const SPEED = 100.0
const JUMP_VELOCITY = -180.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#$AnimatedSprite2D.play("jump")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("move")
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	move_and_slide()




func _on_switch_cameras_body_entered(body: Node2D) -> void:
	print("working")
	if camera_2d.is_current() == true:
		camera_2d_2.make_current()
	elif camera_2d_2.is_current() == true:
		camera_2d.make_current()
	


func _on_switch_cameras_2_body_entered(body: Node2D) -> void:
	print("working")
	if camera_2d_2.is_current() == true:
		camera_2d_3.make_current()
	elif camera_2d_3.is_current() == true:
		camera_2d_2.make_current()


func _on_switch_cameras_3_body_entered(body: Node2D) -> void:
	print("working")
	if camera_2d_3.is_current() == true:
		camera_2d_4.make_current()
	elif camera_2d_4.is_current() == true:
		camera_2d_3.make_current()


func _on_switch_cameras_4_body_entered(body: Node2D) -> void:
	print("working")
	if camera_2d_4.is_current() == true:
		camera_2d_5.make_current()
	elif camera_2d_5.is_current() == true:
		camera_2d_4.make_current()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/first_memory.tscn")
