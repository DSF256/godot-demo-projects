<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Player #

**Extends:** Actor

## Description ##

## Properties ##

Type | Name
 --- | --- 
var | platform_detector
var | sprite
var | animation_player
var | shoot_timer
var | gun
var | coins
var | lives
var | curLife
var | contactWithEnemytimer
var | enemyList
var | deadTimer
var | deadMenu
var | TIMER
var | delay
var | can_shoot

## Methods ##

Type | Name
 --- | --- 
var | func on_timeout_complete()
var | func get_direction()
var | func calculate_move_velocity(linear_velocity, direction, speed, is_jump_interrupted)
var | func get_new_animation(is_shooting = false)

## Property Descriptions ##

### platform\_detector ###

```gdscript
var platform_detector
```

### sprite ###

```gdscript
var sprite
```

### animation\_player ###

```gdscript
var animation_player
```

### shoot\_timer ###

```gdscript
var shoot_timer
```

### gun ###

```gdscript
var gun
```

### coins ###

```gdscript
var coins
```

### lives ###

```gdscript
var lives
```

### curLife ###

```gdscript
var curLife
```

### contactWithEnemytimer ###

```gdscript
var contactWithEnemytimer
```

### enemyList ###

```gdscript
var enemyList
```

### deadTimer ###

```gdscript
var deadTimer
```

### deadMenu ###

```gdscript
var deadMenu
```

### TIMER ###

```gdscript
var TIMER
```

Splitting the physics process logic into functions not only makes it
 easier to read, it help to change or improve the code later on:
 - If you need to change a calculation, you can use Go To -> Function
   (Ctrl Alt F) to quickly jump to the corresponding function.
 - If you split the character into a state machine or more advanced pattern,
   you can easily move individual functions.

### delay ###

```gdscript
var delay
```

### can\_shoot ###

```gdscript
var can_shoot
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
