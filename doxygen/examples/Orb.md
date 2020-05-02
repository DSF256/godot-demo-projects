<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Orb #

**Extends:** Area2D

## Description ##

Class that contains information and behavior for Orbs. 
It's a Collectible that disappears when the player touches it.

## Properties ##

Type | Name
 --- | --- 
AnimationPlayer | animation_player

## Methods ##

Type | Name
 --- | --- 
var | func _on_body_entered(_body)

## Signals ##

- signal orbCollected()

## Property Descriptions ##

### animation\_player ###

```gdscript
var animation_player: AnimationPlayer
```

Animation that makes a sounds when the coin is collected.

## Method Descriptions ##

### \_on\_body\_entered ###

```gdscript
func _on_body_entered(_body)
```

When the player collides with an orb, the orb plays its 'picked' animation.
 The orb is then set to be invisible and unable to be collected again by the
 player.