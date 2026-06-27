extends AudioStreamPlayer
func play_sound():
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = stream
	player.play()
