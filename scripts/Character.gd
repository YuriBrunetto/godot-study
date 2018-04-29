extends KinematicBody2D

export(float) var speed = 128
export(float) var jump_speed = 128

var walking = false
var velocity = Vector2()

var gravity = 2
var jumping = false

func _ready():
	pass

func _physics_process(delta):
	walking = false
	if Input.is_action_pressed("direita"):
		walking = true
		velocity.x = 1
	if Input.is_action_pressed("esquerda"):
		walking = true
		velocity.x = -1
	if Input.is_action_just_pressed("pular"):
		velocity.y = -1
		jumping = true
	
	if walking:
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = (sign(velocity.x) == -1)
		position.x += velocity.x * speed * delta * scale.x
	else:
		$AnimatedSprite.stop()
	