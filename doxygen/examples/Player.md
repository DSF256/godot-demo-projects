<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Player #

**Extends:** Actor

## Description ##

Contains information and behavior for the Player. Such as movement, counters
for lives, and for collectables like Coins and Orbs, and Died and GameOver screen.

## Properties ##

Type | Name
 --- | --- 
RayCast2D | platform_detector
Sprite | sprite
AnimationPlayer | animation_player
Timer | shoot_timer
Gun | gun
Label | livesLabel
Label | coinLabel
Label | orbLabel
int | coins
int | orbs
int | lives
int | curLife
Timer | contactWithEnemytimer
var | enemyList
Timer | deadTimer
Control | deadMenu
Control | gameOverScreen
Label | gameOverLabel
Timer | TIMER
float | delay
bool | can_shoot

## Methods ##

Type | Name
 --- | --- 
var | func on_timeout_complete()
var | func get_direction()
var | func calculate_move_velocity(linear_velocity, direction, speed, is_jump_interrupted)
var | func get_new_animation(is_shooting = false)
void | func _on_coinCollected() -> void
void | func _on_orbCollected() -> void
void | func _collideWithEnemyCheck() -> void
var | func _diedCheck() -> var
void | func _resetLevel(numLives: int) -> void
var | func _gameOver() -> var
String | func _createLabelForCounter(labelName: String, value: int) -> String
void | func _updateCoinLabel() -> void
void | func _updateOrbLabel() -> void
void | func _updateLivesLabel() -> void
void | func _updateHpBar() -> void

## Property Descriptions ##

### platform\_detector ###

```gdscript
var platform_detector: RayCast2D
```

Member variables

### sprite ###

```gdscript
var sprite: Sprite
```

The players body

### animation\_player ###

```gdscript
var animation_player: AnimationPlayer
```

Shooting animation

### shoot\_timer ###

```gdscript
var shoot_timer: Timer
```

Cooldown timer for gun

### gun ###

```gdscript
var gun: Gun
```

Gun, used to shoot enemies

### livesLabel ###

```gdscript
var livesLabel: Label
```

Label showing the amount of lives the player has

### coinLabel ###

```gdscript
var coinLabel: Label
```

Label showing the amount of coins the player has

### orbLabel ###

```gdscript
var orbLabel: Label
```

Label showing the amount of orbs the player has

### coins ###

```gdscript
var coins: int = 0
```

Current amount of coins, displayed to user

### orbs ###

```gdscript
var orbs: int = 0
```

Current amount of orbs, displayed to user

### lives ###

```gdscript
var lives: int = 1
```

Current amount of lives, displayed to user

### curLife ###

```gdscript
var curLife: int = 100
```

Current amount of life (HP points), displayed to user

### contactWithEnemytimer ###

```gdscript
var contactWithEnemytimer: Timer
```

Timer used to

### enemyList ###

```gdscript
var enemyList
```

List of the names of the enemies
When the player comes into contact with these enemies, the Player
loses life points

### deadTimer ###

```gdscript
var deadTimer: Timer
```

Timer for the DiedMenu. This is how long the Diedmenu will show
before disappearing

### deadMenu ###

```gdscript
var deadMenu: Control
```

Control for the Died Menu. Contains the screen to show the user upon death
as well as a "you died" message

### gameOverScreen ###

```gdscript
var gameOverScreen: Control
```

Control for the Game Over Screen. Contains the screen to show the user upon
death. Also clearly dipsplays to the user that they have ran out of lives
and they have to restart the game from the beginning

### gameOverLabel ###

```gdscript
var gameOverLabel: Label
```

Label for the GameOverScreen. Displays and insulting message to the user
Who just lost all of their lives

### TIMER ###

```gdscript
var TIMER: Timer
```

Splitting the physics process logic into functions not only makes it
 easier to read, it help to change or improve the code later on:
 - If you need to change a calculation, you can use Go To -> Function
   (Ctrl Alt F) to quickly jump to the corresponding function.
 - If you split the character into a state machine or more advanced pattern,
   you can easily move individual functions.

### delay ###

```gdscript
var delay: float = 0.25
```

### can\_shoot ###

```gdscript
var can_shoot: bool = true
```

## Method Descriptions ##

### on\_timeout\_complete ###

```gdscript
func on_timeout_complete()
```

### get\_direction ###

```gdscript
func get_direction()
```

### calculate\_move\_velocity ###

```gdscript
func calculate_move_velocity(linear_velocity, direction, speed, is_jump_interrupted)
```

### get\_new\_animation ###

```gdscript
func get_new_animation(is_shooting = false)
```

### \_on\_coinCollected ###

```gdscript
func _on_coinCollected() -> void
```

Signal method connected to all coins. When a user collects a coin, the 
amount of coins the user has increases by 1. If the player has reached 
alotted amount to increase their life, the amount of coins is decreased 
by that amount with the lives increasing by 1.
This method also updated the label in the main screen.

### \_on\_orbCollected ###

```gdscript
func _on_orbCollected() -> void
```

Signal method connected to all orbs. When a user collects an orb, the 
amount of orbs increases. When a player has collected the amout required
per level, they advance to the next level.

### \_collideWithEnemyCheck ###

```gdscript
func _collideWithEnemyCheck() -> void
```

Check to see if the player has collided with any enemies.
If so, deal damage to the player. There is a cooldown timer, so a 
player doesn't take damage as fast as the program allows.

### \_diedCheck ###

```gdscript
func _diedCheck() -> var
```

Checks if the player has died. If a players HP hits 0 (or below), the player
is considered dead. 
The player is then:
1) respawned with full health, but with 1 fewer life
2) loses all coins and orbs
3) Is shown a screen telling them they have died.

If the player has ran out lives, it's game over.
They will start the game all over again, no coins, no orbs, full HP, and one
life

### \_resetLevel ###

```gdscript
func _resetLevel(numLives: int) -> void
```

This method resets the level when a player has lost a life.
The players HP is restored to full and the labels are updated 
reflecting the loss of a life, loss of coins and orbs, and full health
Coins are also reset so the player can collect them again
param: numLives - Number of lives the player now has.

### \_gameOver ###

```gdscript
func _gameOver() -> var
```

The Player's life count has reached 0. The level needs to be reset
and the user will see the game over screen. Resets the level and gives the 
Player 1 life.

### \_createLabelForCounter ###

```gdscript
func _createLabelForCounter(labelName: String, value: int) -> String
```

### \_updateCoinLabel ###

```gdscript
func _updateCoinLabel() -> void
```

Updates the coin lable when the user either a) collects a coin or b) has lost
 a life

### \_updateOrbLabel ###

```gdscript
func _updateOrbLabel() -> void
```

Updates the Orb Label when the user either a) collects an orb or b) has lost
 a life

### \_updateLivesLabel ###

```gdscript
func _updateLivesLabel() -> void
```

Updates the Lives Label when the player has with a) collected the allotted
amount of coins to gain a life or b) has lost a life

### \_updateHpBar ###

```gdscript
func _updateHpBar() -> void
```

updates the HP bar when the player takes damage or the level is reset due to 
loss of life