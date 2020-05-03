class_name Bullet
extends RigidBody2D


onready var animation_player = $AnimationPlayer


func destroy():
	print("destroy function(Bullet.gd)")
	animation_player.play("destroy")


func _on_body_entered(body):
	print("_on_body_entered function(Bullet.gd)")
	if body is Enemy:
		body.destroy()
