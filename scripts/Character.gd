extends KinematicBody2D

export(float) var speed = 128

var walking = false

func _ready():
	pass

func _physics_process(delta):
	walking = false
	if Input.is_action_pressed("direita"):
		walking = true
		$AnimatedSprite.flip_h = false
		position.x += speed * delta * scale.x
	if Input.is_action_pressed("esquerda"):
		walking = true
		$AnimatedSprite.flip_h = true
		position.x -= speed * delta * scale.x
	
	if walking:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()