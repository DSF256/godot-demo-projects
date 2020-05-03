<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Coin #

**Extends:** Area2D

## Description ##

Class to hold information and behavior about the Coins in the game.
Coins are a collectable to disappear when collected by the player.

## Properties ##

Type | Name
 --- | --- 
AnimationPlayer | animation_player

## Methods ##

Type | Name
 --- | --- 
void | func _on_body_entered(_body) -> void

## Signals ##

- signal coinCollected()

## Property Descriptions ##

### animation\_player ###

```gdscript
var animation_player: AnimationPlayer
```

Animation that makes a sounds when the coin is collected.

## Method Descriptions ##

### \_on\_body\_entered ###

```gdscript
func _on_body_entered(_body) -> void
```

When the player collides with a coin, the coin plays its 'picked' animation.
 The coin is then set to be invisible and no longer able to be collected.
 Click the AnimationPlayer node to see the animation timeline.