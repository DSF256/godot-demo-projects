# Represents a weapon that spawns and shoots bullets.
class_name Gun
extends Position2D

var s1 = true

#Constants
#Speed of the bullet
const BULLET_VELOCITY = 1000.0
#Bullet image
const Bullet = preload("res://src/Objects/Bullet.tscn")

#Member Variables

#Sound the gun makes when fired
onready var sound_shoot: AudioStreamPlayer2D = $Shoot
# The Cooldown timer controls the cooldown duration between shots.
onready var timer: Timer = $Cooldown

#This method contains behavior for shooting the gun. 
#It creates a bullet and fires in the direction the player is facing
#parameter: direction - direction the bullet should fire (1 = forward)
func shoot(direction: int = 1) -> bool:
	if not timer.is_stopped():
		return false
		if(s1 == true):
			print("Shooting timer (Gun.gd) called for first time, won't display again")
			s1 = false
	var bullet: Bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY, 0)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	print("Bullet fired (Gun.gd)")
	return true
