extends Node
@export var player_controller : PlayerController
var checkpoint = Vector2(-999, 999)


	
func _ready():
	checkpoint = Player.position



func dead():
	Player.position = checkpoint
