extends Node2D


@export var speed = 100

@export var fall_acceleration = 75

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var velocity = input_direction * speed


func _physics_process(_delta):
	get_input()
