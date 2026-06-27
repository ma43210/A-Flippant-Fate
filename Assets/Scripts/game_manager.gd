extends Node
var checkpoint = Vector2(-999, 999)
var escape = false
var escape_music = false
var music: AudioStreamPlayer
var background_music = preload("res://Assets/Music/Flaming_Temper.mp3")

func _ready():
	checkpoint = Player.position
	music = AudioStreamPlayer.new()
	add_child(music)

func play_music(track: AudioStream):
	music.stream = track
	music.play()

func stop_music(track: AudioStream):
	music.stream = track
	music.stop()
func dead():
	Player.position = checkpoint
