class_name titleScreen
extends Node

onready var _startBtn: Button  = $MarginContainer/VBoxContainer/VBoxContainer/StartBtn
onready var _exitBtn: Button = $MarginContainer/VBoxContainer/VBoxContainer/ExitBtn

func _ready():
	_startBtn.grab_focus()

func _physics_process(delta):
	if (_startBtn.is_hovered()):
		_startBtn.grab_focus()
	if (_exitBtn.is_hovered()):
		_exitBtn.grab_focus()


func _on_StartBtn_pressed():
	get_tree().change_scene("res://src/Main/Game.tscn")


func _on_exitBtn_pressed():
	get_tree().quit()
