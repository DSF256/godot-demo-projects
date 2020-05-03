#Class the contains behavior for the DiedMenu
#The contents of the DiedMenu are defined within the Scene Editor.
#This class is strictly behavior.
class_name DiedMenu
extends Control

#When the game is first loaded, we do not want to show the DiedMenu
#as the player has not died.....yet
func _ready():
	#hides the DiedMenu
	self.visible = false

#Closes the DiedMenu by setting the visibility to false.
func close():
	#hides the DiedMenu
	self.visible = false
	
#Opens the DiedMenu by setting the visibility to false.
#This is done instead of loading the menu to save memory.
func open():
	#shows the DiedMenu
	self.visible = true
