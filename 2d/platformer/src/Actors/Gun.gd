# Represents a weapon that spawns and shoots bullets.
class_name Gun
extends Position2D

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
	#pre-conditions
	assert(sound_shoot != null)
	assert(timer != null)
	assert(Bullet != null)
	assert(global_position != null)
	assert(BULLET_VELOCITY != null)
	
	###METHOD BODY  START ###
	
	#check if the timer is running
	#if it is, Player cannot shoot
	if not timer.is_stopped():
		return false
	var bullet: Bullet = Bullet.instance()
	#Sets the starting position for the bullet
	bullet.global_position = global_position
	#Sets how fast the bullet is going to travel
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY, 0)

	#Shows the bullet on the screen
	bullet.set_as_toplevel(true)
	add_child(bullet)
	#Make the shoot sound
	sound_shoot.play()
	
	###METHOD BODY  END ###
	
	#Post Checks to confirm the pre conditions are still met
	assert(sound_shoot != null)
	assert(timer != null)
	assert(Bullet != null)
	assert(global_position != null)
	assert(BULLET_VELOCITY != null)
	
	
	return true
