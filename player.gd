extends CharacterBody2D

@export var SPEED = 300.0
@onready var animation_player = $AnimationPlayer

func _process(delta):
	global_rotation = global_position.direction_to(get_global_mouse_position()).angle() + PI/2.0

func _physics_process(delta):
	var move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_dir * SPEED
	if velocity.normalized().length() > 0:
		animation_player.play("walk")
	move_and_slide()
