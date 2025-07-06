extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#Gira al personaje 
	if velocity.x < 0:
		$AnimatedSprite2D.scale.x = -1
	elif velocity.x > 0:
		$AnimatedSprite2D.scale.x = 1

	move_and_slide()


func _on_area_game_over_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
