extends Node2D

@export var player_scene: PackedScene

func _ready():
	var index = 0
	for id in Lobby.players:
		if id != 1:
			var current_player = player_scene.instantiate()
			current_player.name = str(id)
			add_child(current_player)
			for spawn in get_tree().get_nodes_in_group("spawn_points"):
				if spawn.name == str(index):
					current_player.global_position = spawn.global_position
			index += 1
