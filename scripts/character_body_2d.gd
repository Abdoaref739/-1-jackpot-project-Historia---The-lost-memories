extends CharacterBody2D

const SPEED = 180.0
const JUMP_VELOCITY = -350
const GRAVITY = 1100.0
var jump_count = 0

var is_attacking = false

func _ready():
	$AnimatedSprite2D.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jump_count = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")

	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		$AnimatedSprite2D.play("attack1")
		return 

	if direction != 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
		
		if Input.is_action_just_pressed("dash") and not is_attacking:
			$AnimatedSprite2D.play("dash")
			velocity.x = direction * SPEED * 12
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 6 * delta)
	
	if not is_attacking:
		if direction != 0:
			if not is_on_floor():
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("run")
		else:
			if not is_on_floor():
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("idle")
	
	move_and_slide()

func _on_animation_finished():
	if $AnimatedSprite2D.animation == "attack1":
		is_attacking = false
