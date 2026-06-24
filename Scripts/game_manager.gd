extends Node
@export var player_controller : PlayerController
var checkpoint

func _ready():
	checkpoint = PlayerController.position


func set_checkpoint(coordinates):
	checkpoint = coordinates



func dead():
	PlayerController.position = checkpoint
	
