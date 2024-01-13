extends Control


func _on_join_pressed():
	if Lobby.multiplayer.get_peers().size() < 1:
		Lobby.join_game()


func _on_start_game_pressed():
	if Lobby.multiplayer.get_peers().size() > 0:
		Lobby.load_game.rpc("res://scenes/world.tscn")
