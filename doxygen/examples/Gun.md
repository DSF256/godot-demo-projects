<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Gun #

**Extends:** Position2D

## Description ##

Represents a weapon that spawns and shoots bullets.

## Properties ##

Type | Name
 --- | --- 
AudioStreamPlayer2D | sound_shoot
Timer | timer

## Methods ##

Type | Name
 --- | --- 
bool | func shoot(direction: int = 1) -> bool

## Property Descriptions ##

### sound\_shoot ###

```gdscript
var sound_shoot: AudioStreamPlayer2D
```

Sound the gun makes when fired

### timer ###

```gdscript
var timer: Timer
```

The Cooldown timer controls the cooldown duration between shots.

## Method Descriptions ##

### shoot ###

```gdscript
func shoot(direction: int = 1) -> bool
```

This method contains behavior for shooting the gun. 
It creates a bullet and fires in the direction the player is facing
parameter: direction - direction the bullet should fire (1 = forward)