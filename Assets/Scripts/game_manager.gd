extends Node
var checkpoint = Vector2(-999, 999)
var escape = false

	
func _ready():
	checkpoint = Player.position
	


func dead():
	Player.position = checkpoint
