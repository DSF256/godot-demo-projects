<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Enemy #

**Extends:** Actor

## Description ##

## Properties ##

Type | Name
 --- | --- 
var | platform_detector
var | floor_detector_left
var | floor_detector_right
var | sprite
var | animation_player

## Methods ##

Type | Name
 --- | --- 
var | func calculate_move_velocity(linear_velocity)
var | func destroy()
var | func get_new_animation()

## Enumerations ##

### State ###

```gdscript
const State: Dictionary = {"DEAD":1,"WALKING":0}
```

## Property Descriptions ##

### platform\_detector ###

```gdscript
var platform_detector
```

### floor\_detector\_left ###

```gdscript
var floor_detector_left
```

### floor\_detector\_right ###

```gdscript
var floor_detector_right
```

### sprite ###

```gdscript
var sprite
```

### animation\_player ###

```gdscript
var animation_player
```

## Method Descriptions ##

### calculate\_move\_velocity ###

```gdscript
func calculate_move_velocity(linear_velocity)
```

This function calculates a new velocity whenever you need it.
 If the enemy encounters a wall or an edge, the horizontal velocity is flipped.

### destroy ###

```gdscript
func destroy()
```

### get\_new\_animation ###

```gdscript
func get_new_animation()
```
