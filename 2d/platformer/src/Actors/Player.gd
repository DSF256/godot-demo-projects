#Contains information and behavior for the Player. Such as movement, counters
#for lives, and for collectables like Coins and Orbs, and Died and GameOver screen.
class_name Player
extends Actor

#Member variables

onready var platform_detector: RayCast2D = $PlatformDetector
#The players body
onready var sprite: Sprite = $Sprite
#Shooting animation
onready var animation_player:AnimationPlayer = $AnimationPlayer
#Cooldown timer for gun
onready var shoot_timer: Timer = $ShootAnimation
#Gun, used to shoot enemies
onready var gun: Gun = $Sprite/Gun
#Label showing the amount of lives the player has
onready var livesLabel: Label = $UI/amtLivesLabel
#Label showing the amount of coins the player has
onready var coinLabel: Label = $UI/amtCoinsLabel
#Label showing the amount of orbs the player has
onready var orbLabel: Label = $UI/amtOrbsLabel

#Current amount of coins, displayed to user
var coins: int = 0
#Current amount of orbs, displayed to user
var orbs: int = 0
#Current amount of lives, displayed to user
var lives: int = 1
#Current amount of life (HP points), displayed to user
var curLife: int = 100
#Timer used as a cooldown for contact with the enemies
onready var contactWithEnemytimer: Timer = $enemyContactCooldown

#List of the names of the enemies
#When the player comes into contact with these enemies, the Player
#loses life points
var enemyList = ["Enemy", "Enemy2" ,"Enemy3", "Enemy4"]

#Timer for the DiedMenu. This is how long the Diedmenu will show
#before disappearing
onready var deadTimer: Timer = $UI/DiedMenuControl/DiedMenuTimer
#Control for the Died Menu. Contains the screen to show the user upon death
#as well as a "you died" message
onready var deadMenu: Control = $UI/DiedMenuControl
#Control for the Game Over Screen. Contains the screen to show the user upon
#death. Also clearly dipsplays to the user that they have ran out of lives
#and they have to restart the game from the beginning
onready var gameOverScreen: Control = get_parent().get_parent().get_node("InterfaceLayer/GameOverScreen")
#Label for the GameOverScreen. Displays and insulting message to the user
#Who just lost all of their lives
onready var gameOverLabel: Label = self.gameOverScreen.get_node("GameOverLabel")

#List of possible messages for the GameOverScreen
var _gameOverMessages = ["You are not good enough....\n\nI suggest getting better at the game..", 
						"Your bloodline is weak.", 
						"Try and easier game. Checkers, perhaps",
						"Let your older brother try this level",
						"LOSER"]

#Constants

#Amount of coins needed to gain a life
const AMT_COINS_TO_LEVEL_UP: int = 20
#Amount of orbs needed to advance to level 2
const ORBS_NEEDED: int = 4
#Maximum life for a player
const MAX_LIFE: int = 100
#Amount of life lost per collision with enemys
const DAMAGE_PER_HIT: int = 25 
const FLOOR_DETECT_DISTANCE = 20.0

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
var TIMER: Timer = null
var delay: float = 0.25
var can_shoot: bool = true

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

#Signal method connected to all coins. When a user collects a coin, the 
#amount of coins the user has increases by 1. If the player has reached 
#alotted amount to increase their life, the amount of coins is decreased 
#by that amount with the lives increasing by 1.
#This method also updated the label in the main screen.
func _on_coinCollected():
	#pre-conditions
	#self.coins != null
	#self.AMT_COINS_TO_LEVEL_UP != null
	#self.lives != null
	assert(self.coins != null)
	assert(self.AMT_COINS_TO_LEVEL_UP != null)
	assert(self.lives != null)
	###METHOD BODY  START ###
	
	#The Player has collected a coin, increase the count
	self.coins = self.coins + 1
	
	#Check if the Player has collected enough coins to increase their life count  by 1
	if(self.coins == self.AMT_COINS_TO_LEVEL_UP):
		#The player has reached the amount needed to gain a life. Increase life
		#count by 1, decrease their coin count to reflect the gain of life and update the life label
		self.lives = self.lives + 1
		self.coins = self.coins - self.AMT_COINS_TO_LEVEL_UP
		_updateLivesLabel()
	
	#update the coin label for the Player to see how many coins they have
	_updateCoinLabel()
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(self.coins != null)
	assert(self.AMT_COINS_TO_LEVEL_UP != null)
	assert(self.lives != null)	

#Signal method connected to all orbs. When a user collects an orb, the 
#amount of orbs increases. When a player has collected the amout required
#per level, they advance to the next level.
func _on_orbCollected():
	#pre-conditions
	#self.orbs != null
	#self.ORBS_NEEDED != null
	#get_tree() != null
	assert(self.orbs != null)
	assert(self.ORBS_NEEDED != null)
	assert(get_tree() != null)
	###METHOD BODY  START ###
	
	#The Player has collected an orb, increase the count and update the 
	#label for the Player to see
	self.orbs = self.orbs + 1
	_updateOrbLabel()
	
	#Quit the game when the Player has reached the Orbs required for this Level
	#This is temporary, as there will be more levels soon. Will be converted 
	#to advancement to the next level
	if (self.orbs >= self.ORBS_NEEDED):
		get_tree().quit()
		
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(self.orbs != null)
	assert(self.ORBS_NEEDED != null)
	assert(get_tree() != null)


#Check to see if the player has collided with any enemies.
#If so, deal damage to the player. There is a cooldown timer, so a 
#player doesn't take damage as fast as the program allows.
func _collideWithEnemyCheck():
	#pre-conditions
	#get_slide_count() != null
	#self.contactWithEnemytimer is a Timer (is check is also a null check)
	#enemyList != null and has > 0 elements
	#self.curLife != null
	#self.DAMAGE_PER_HIT != null
	assert(get_slide_count() != null)
	assert(self.contactWithEnemytimer is Timer)
	assert(self.enemyList != null and self.enemyList.size() > 0)
	assert(self.curLife != null)
	assert(self.DAMAGE_PER_HIT != null)
	###METHOD BODY  START ###
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if self.contactWithEnemytimer.is_stopped() and self.enemyList.has(get_slide_collision(i).collider.name):
				#Collision with enemy causes damage to the player. Take away damage from HP
				self.curLife = self.curLife - self.DAMAGE_PER_HIT
				#if the Player now has negative damage, bump up to 0 (0 is still dead)
				if(self.curLife < 0):
					self.curLife = 0
				#Reflect the new HP count to the Player
				_updateHpBar()
				#Start the cooldown timer. Player should not take damage as fast as the program will allow
				self.contactWithEnemytimer.start()
				#Check if the Player has died
				_diedCheck()
					
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(get_slide_count() != null)
	assert(self.contactWithEnemytimer is Timer)
	assert(self.enemyList != null and self.enemyList.size() > 0)
	assert(self.curLife != null)
	assert(self.DAMAGE_PER_HIT != null)

#Checks if the player has died. If a players HP hits 0 (or below), the player
#is considered dead. 
#The player is then:
#1) respawned with full health, but with 1 fewer life
#2) loses all coins and orbs
#3) Is shown a screen telling them they have died.
#
#If the player has ran out lives, it's game over.
#They will start the game all over again, no coins, no orbs, full HP, and one
#life
func _diedCheck():
	#pre-conditions
	#self.curLife != null
	#self.lives != null
	#get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer").get_children() != null
	#deadMenu != null and is a Control (can be opened and closed)
	assert(self.curLife != null)
	assert(self.lives != null)
	assert(get_parent() != null and get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer") != null and get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer").get_children() != null)
	assert(self.deadMenu is Control)
	###METHOD BODY  START ###
	
	if(self.curLife <=0): #Player has died
		#Puts player back to levels origin spawn point
		#move back to respawn first, so enemies don't further damage him
		self.set_global_position(Vector2(86, 545))
		
		#take away life from Player
		self.lives = self.lives - 1
		if(self.lives == 0): 
			#Player has 0 lives, it is game over
			self.deadTimer.start()
			_gameOver()
		else:
			self.deadTimer.start()
			#Hides the HP bar, so the deadMenu can be fully shown
			for item in get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer").get_children():
				item.visible = false
			deadMenu.open()
			yield(self.deadTimer, "timeout")
			deadMenu.close()
			
			#Shows the HP bar to the Player
			for item in get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer").get_children():
				item.visible = true
			_resetLevel(self.lives)
			
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(self.curLife != null)
	assert(self.lives != null)
	assert(get_parent() != null and get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer") != null and get_parent().get_node("Player/UI/hpCanvasLayer/hpContainer").get_children() != null)
	assert(self.deadMenu is Control)
	
#This method resets the level when a player has lost a life.
#The players HP is restored to full and the labels are updated 
#reflecting the loss of a life, loss of coins and orbs, and full health
#Coins are also reset so the player can collect them again
#param: numLives - Number of lives the player now has.
func _resetLevel(numLives: int) -> void:
	#pre-conditions
	#nulLives != null
	#self.lives != null
	#self.curLife != null
	#self.MAX_LIFE != null
	#self.orbs != null
	#self.coins != null
	#get_Parent().getNodes("Coins") != null, as well as .get_children() != nulll
	#get_parent().get_node("Orbs") != null as well as .get_children() != nulll
	assert(numLives != null)
	assert(self.lives != null)
	assert(self.curLife != null)
	assert(self.MAX_LIFE != null)
	assert(self.orbs != null)
	assert(self.coins != null)
	assert(get_parent() != null and get_parent().get_node("Coins") != null and get_parent().get_node("Coins").get_children() != null)
	assert(get_parent() != null and get_parent().get_node("Orbs") != null and get_parent().get_node("Orbs").get_children() != null)
	###METHOD BODY  START ###
	
	#updates the amount of lives, HP, an collectable counts
	self.lives = numLives
	self.curLife = self.MAX_LIFE
	self.orbs = 0
	self.coins = 0
	#updates the labels shows in the main screen for HP, Collectables, and amount of Player lives
	_updateHpBar()
	_updateCoinLabel()
	_updateLivesLabel()
	_updateOrbLabel()
	
	#Reset coins to be shown. I.e not collected yet
	var coinsForReset = get_parent().get_node("Coins").get_children()
	for coin in coinsForReset:
		for c in coin.get_children():
			c.visible = true
			
	#Reset orbs to be shown. I.e not collected yet
	var orbs = get_parent().get_node("Orbs").get_children()
	for orb in orbs:
		orb.visible = true
		
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(numLives != null)
	assert(self.lives != null)
	assert(self.curLife != null)
	assert(self.MAX_LIFE != null)
	assert(self.orbs != null)
	assert(self.coins != null)
	assert(get_parent() != null and get_parent().get_node("Coins") != null and get_parent().get_node("Coins").get_children() != null)
	assert(get_parent() != null and get_parent().get_node("Orbs") != null and get_parent().get_node("Orbs").get_children() != null)

#The Player's life count has reached 0. The level needs to be reset
#and the user will see the game over screen. Resets the level and gives the 
#Player 1 life. 
func _gameOver() -> void:
	#pre-conditions
	#self._gameOverMessages != null and has at least 1 element
	#self.gameoverlabel != null
	#self.gameOverScreen is Control (Can be shown and hidden)
	#self.deadTimer is a timer 
	assert(self._gameOverMessages != null && self._gameOverMessages.size() > 0)
	assert(self.gameOverLabel != null)
	assert(self.gameOverScreen is Control)
	# This takes care of the null check as well since null can't be a Timer
	assert(self.deadTimer is Timer)  
	
	###METHOD BODY  START ###
	#set game over text
	var randNum: int = randi() % self._gameOverMessages.size() + 1
	self.gameOverLabel.text = self._gameOverMessages[randNum - 1]
	
	self.gameOverScreen.visible = true
	yield(self.deadTimer, "timeout")
	self.gameOverScreen.visible = false
	_resetLevel(1)
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(self._gameOverMessages != null && self._gameOverMessages.size() > 0)
	assert(self.gameOverLabel != null)
	assert(self.gameOverScreen is Control)
	# This takes care of the null check as well since null can't be a Timer
	assert(self.deadTimer is Timer)  
	

#This is a helper method for creating the coin, life, and orb labels
#The label name is concatanated with a semi colon and the value
#to produce each label
func _createLabelForCounter(labelName: String, value: int) -> String:
	#pre-conditions
	#labelName != null
	#value != null && >= 0
	assert(labelName != null)
	assert(value != null and value >= 0)
	###METHOD BODY  START ###
	var returnLabel: String = labelName + ": " + str(value)
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(returnLabel != null)
	
	return returnLabel

#Updates the coin label when the user either a) collects a coin or b) has lost
#a life
func _updateCoinLabel() -> void:
	#pre-conditions
	#self.coinLabel != null
	#self.coins != null && >= 0
	assert(self.coinLabel != null)
	assert(self.coins != null and self.coins >= 0)
	###METHOD BODY  START ###
	
	self.coinLabel.text =  _createLabelForCounter("Coins", self.coins)
	###METHOD BODY  END ###
	
	#Post Checks to confirm the pre conditions are still met
	assert(self.coinLabel != null)
	assert(self.coins != null and self.coins >= 0)
	
#Updates the Orb Label when the user either a) collects an orb or b) has lost
# a life
func _updateOrbLabel() -> void:
	#pre-conditions
	#self.orbLabel != null
	#self.orbs != null && >= 0
	assert(self.orbLabel != null)
	assert(self.orbs != null and self.orbs >= 0)
	
	###METHOD BODY  START ###
	self.orbLabel.text = _createLabelForCounter("Orbs", self.orbs)
	###METHOD BODY  END ###
	
	#Post Checks to confirm the pre conditions are still met
	assert(self.orbLabel != null)
	assert(self.orbs != null and self.orbs >= 0)
	
	
#Updates the Lives Label when the player has with a) collected the allotted
#amount of coins to gain a life or b) has lost a life
func _updateLivesLabel() -> void:
	#pre-conditions
	#self.livesLabel != null
	#self.lives != null && > 0
	assert(self.livesLabel != null)
	assert(self.lives != null and self.lives > 0)
	
	###METHOD BODY  START ###
	
	self.livesLabel.text =  _createLabelForCounter("Lives", self.lives)
	
	###METHOD BODY  END ###
	
	#Post Checks to confirm the pre conditions are still met
	assert(self.livesLabel != null)
	assert(self.lives != null and self.lives > 0)
	
#updates the HP bar when the player takes damage or the level is reset due to 
#loss of life
func _updateHpBar() -> void:
	#Pre-conditions
	#hpLabel is a Label && hpBar is a Texture Progress (also takes care of null check)
	#self.curLife is not null and >= 0
	#maxlife is not null
	assert($UI/hpCanvasLayer/hpContainer/hpLabel is Label and $UI/hpCanvasLayer/hpContainer/hpBar is TextureProgress)
	assert(self.curLife != null and self.curLife >= 0)
	assert(self.MAX_LIFE != null)
	
	###METHOD BODY  START ###
	$UI/hpCanvasLayer/hpContainer/hpLabel.text = "HP " + str(self.curLife) + "/" + str(self.MAX_LIFE)
	$UI/hpCanvasLayer/hpContainer/hpBar.value = self.curLife
	
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert($UI/hpCanvasLayer/hpContainer/hpLabel is Label and $UI/hpCanvasLayer/hpContainer/hpBar is TextureProgress)
	assert(self.curLife != null and self.curLife >= 0)
	assert(self.MAX_LIFE != null)
