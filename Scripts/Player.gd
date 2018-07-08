extends KinematicBody2D

const SPEED = 750
const JUMP_SPEED = -1500
const GRAVITY = 4000
const UP = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)
	
func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
	
func run():
	if Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		$AnimatedSprite.flip_h = false
		


func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = JUMP_SPEED
