extends Node
@export var player_controller : PlayerController
var checkpoint


	
func _ready():
	checkpoint = Vector2(-4, 9)



func dead():
	player_controller.position = checkpoint
