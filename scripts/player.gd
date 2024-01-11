extends CharacterBody2D

@export var SPEED = 300.0
@onready var animation_player = $AnimationPlayer


func _enter_tree():
	$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())


func _process(delta):
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		look_at(get_global_mouse_position())
		if Input.is_action_pressed("primary"):
			animation_player.play("sword_slash")
		if Input.is_action_pressed("secondary"):
			animation_player.play("shield_raise")


func _physics_process(delta):
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		var move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = move_dir * SPEED
		move_and_slide()
