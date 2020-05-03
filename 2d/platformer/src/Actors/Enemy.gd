class_name Enemy
extends Actor

enum State {
	WALKING,
	DEAD
}

# vars that determine whether the player is walking or not; only called ONCE
var w1 = true
var w2 = true
var w3 = true
var w4 = true
var w5 = true
var w6 = true
var w7 = true

var _state = State.WALKING

onready var platform_detector = $PlatformDetector
onready var floor_detector_left = $FloorDetectorLeft
onready var floor_detector_right = $FloorDetectorRight
onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer

# This function is called when the scene enters the scene tree.
# We can initialize variables here.
func _ready():
	_velocity.x = speed.x
	var INTEGER = 1
	while(INTEGER !=0):
		var NUMBER = randi()%5+1
		speed.x = randi()%5*50
		yield(get_tree().create_timer(NUMBER), "timeout")
		_velocity.y = (-250)
		if(w1 == true):
			print("_ready func (Enemy.gd) called for first time, won't display again")
			w1 = false
		

# Physics process is a built-in loop in Godot.
# If you define _physics_process on a node, Godot will call it every frame.

# At a glance, you can see that the physics process loop:
# 1. Calculates the move velocity.
# 2. Moves the character.
# 3. Updates the sprite direction.
# 4. Updates the animation.

# Splitting the physics process logic into functions not only makes it
# easier to read, it help to change or improve the code later on:
# - If you need to change a calculation, you can use Go To -> Function
#   (Ctrl Alt F) to quickly jump to the corresponding function.
# - If you split the character into a state machine or more advanced pattern,
#   you can easily move individual functions.
func _physics_process(_delta):
	_velocity = calculate_move_velocity(_velocity)

	# We only update the y value of _velocity as we want to handle the horizontal movement ourselves.
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

	# We flip the Sprite depending on which way the enemy is moving.
	sprite.scale.x = 1 if _velocity.x > 0 else -1

	var animation = get_new_animation()
	if animation != animation_player.current_animation:
		animation_player.play(animation)
		if(w2 == true):
			print("Sprite scaled (Enemy.gd) called for first time, won't display again")
			w2 = false


# This function calculates a new velocity whenever you need it.
# If the enemy encounters a wall or an edge, the horizontal velocity is flipped.
func calculate_move_velocity(linear_velocity):
	var velocity = linear_velocity

	if not floor_detector_left.is_colliding():
		velocity.x = speed.x
		if(w3 == true):
			print("Enemy moved left (Enemy.gd) called for first time, won't display again")
			w3 = false
	elif not floor_detector_right.is_colliding():
		velocity.x = -speed.x
		if(w4 == true):
			print("Enemy moved right (Enemy.gd) called for first time, won't display again")
			w4 = false

	if is_on_wall():
		velocity.x *= -1
		if(w5 == true):
			print("Enemy on wall (Enemy.gd) called for first time, won't display again")
			w5 = false

	return velocity


func destroy():
	_state = State.DEAD
	_velocity = Vector2.ZERO
	print("Enemy destroyed")


func get_new_animation():
	var animation_new = ""
	if _state == State.WALKING:
		animation_new = "walk" if abs(_velocity.x) > 0 else "idle"
		if(w6 == true):
			print("Enemy walking (Enemy.gd) called for first time, won't display again")
			w6 = false
	else:
		animation_new = "destroy"
		if(w7 == true):
			print("Enemy destroyed (Enemy.gd) called for first time, won't display again")
			w7 = false
	return animation_new
