class_name Player
extends Actor


const FLOOR_DETECT_DISTANCE = 20.0

onready var platform_detector = $PlatformDetector
onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer
onready var shoot_timer = $ShootAnimation
onready var gun = $Sprite/Gun

var coins = 0.0
var lives = 1.0
var curLife = 100.0
onready var contactWithEnemytimer = $enemyContactCooldown

const AMT_COINS_TO_LEVEL_UP = 20.0
const MAX_LIFE = 100.0
const DAMAGE_PER_HIT = 25.0 #Amount of life lost per collision with enemys

var enemyList = ["Enemy", "Enemy2" ,"Enemy3", "Enemy4"]


# Physics process is a built-in loop in Godot.
# If you define _physics_process on a node, Godot will call it every frame.

# We use separate functions to calculate the direction and velocity to make this one easier to read.
# At a glance, you can see that the physics process loop:
# 1. Calculates the move direction.
# 2. Calculates the move velocity.
# 3. Moves the character.
# 4. Updates the sprite direction.
# 5. Shoots bullets.
# 6. Updates the animation.

# Splitting the physics process logic into functions not only makes it
# easier to read, it help to change or improve the code later on:
# - If you need to change a calculation, you can use Go To -> Function
#   (Ctrl Alt F) to quickly jump to the corresponding function.
# - If you split the character into a state machine or more advanced pattern,
#   you can easily move individual functions.
var TIMER = null
var delay = 0.25
var can_shoot = true

func on_timeout_complete():
	can_shoot = true

func _physics_process(_delta):
	var direction = get_direction()

	var is_jump_interrupted = Input.is_action_just_released("jump") and _velocity.y < 0.0
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)

	
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	var is_on_platform = platform_detector.is_colliding()
	_velocity = move_and_slide_with_snap(
		_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
	)

	# When the character’s direction changes, we want to to scale the Sprite accordingly to flip it.
	# This will make Robi face left or right depending on the direction you move.
	if direction.x != 0:
		sprite.scale.x = direction.x

	# We use the sprite's scale to store Robi’s look direction which allows us to shoot
	# bullets forward.
	# There are many situations like these where you can reuse existing properties instead of
	# creating new variables.
	TIMER = Timer.new()
	TIMER.set_one_shot(true)
	TIMER.set_wait_time(delay)
	TIMER.connect("timeout",self,"on_timeout_complete")
	add_child(TIMER)
	var is_shooting = false
	if (Input.get_action_strength("shoot") && can_shoot):
		is_shooting = gun.shoot(sprite.scale.x)
		can_shoot = false
		TIMER.start()
	if Input.get_action_strength("ui_hover"):
		_velocity.y =- 5
	var animation = get_new_animation(is_shooting)
	if animation != animation_player.current_animation and shoot_timer.is_stopped():
		if is_shooting:
			shoot_timer.start()
		animation_player.play(animation)
		
	_collideWithEnemyCheck()
	



func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)


# This function calculates a new velocity whenever you need it.
# It allows you to interrupt jumps.
func calculate_move_velocity(
		linear_velocity,
		direction,
		speed,
		is_jump_interrupted
	):
	var velocity = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
		
	return velocity


func get_new_animation(is_shooting = false):
	var animation_new = ""
	if is_on_floor():
		animation_new = "run" if abs(_velocity.x) > 0.1 else "idle"
	else:
		animation_new = "falling" if _velocity.y > 0 else "jumping"
		#MESSING WITH GRAVITY
		_velocity.y -= 10;
	if is_shooting:
		animation_new += "_weapon"
	return animation_new

func _on_coinCollected():
	self.coins = self.coins + 1
	
	if(self.coins == self.AMT_COINS_TO_LEVEL_UP):
		self.lives = self.lives + 1
		self.coins = self.coins - self.AMT_COINS_TO_LEVEL_UP
		$UI/amtLivesLabel.text = "Lives: " + String(self.lives)
	
	$UI/amtCoinsLabel.text = "Coins: " + String(self.coins)


#Check to see if the player has collided with any enemies.
#If so, deal damage to the player
func _collideWithEnemyCheck():
	if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if self.contactWithEnemytimer.is_stopped() and enemyList.has(get_slide_collision(i).collider.name):
					self.curLife = self.curLife - self.DAMAGE_PER_HIT
					$UI/hpCanvasLayer/hpContainer/hpLabel.text = "HP " + str(self.curLife) + "/" + str(self.MAX_LIFE)
					$UI/hpCanvasLayer/hpContainer/hpBar.value = self.curLife
					self.contactWithEnemytimer.start()
						
