extends CharacterBody2D

@export var SPEED = 300.0
@onready var animation_player = $AnimationPlayer

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _process(delta):
	if is_multiplayer_authority():
		look_at(get_global_mouse_position())
		if Input.is_action_pressed("primary"):
			animation_player.play("sword_slash", -1, 2.25)
		if Input.is_action_pressed("secondary"):
			animation_player.play("shield_raise")

func _physics_process(delta):
	if is_multiplayer_authority():
		var move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = move_dir * SPEED
		move_and_slide()
