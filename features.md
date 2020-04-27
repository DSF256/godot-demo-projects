### FEATURES (WORK IN PROGRESS) ### 
### GROUP 09 - GODOT 2D PLATFORMER ### 

### NOTE: WHEN A FEATURE HAS BEEN COMPLETED, MARK IT AS COMPLETE BY PLACING $$$ ABOVE IT ###
  
$$$  
User Story A
As a game player, I want a title screen so that I may choose whether to start the first level of the game, or exit the application.
Task 101: Draw a basic colored background that displays the logo / name of the game on the screen.
Task 102: Program a button that causes the game to advance to the first level when clicked on.
Task 103: Program a button that causes the game to exit (quit) when clicked on.

User Story B
As a game player, I want at least one additional level added to the game (for a total of 2) so that I may enjoy the game for a longer duration of time.
Task 104: Draw and implement at least one additional level into the game, in addition to the current default level.
Task 105: Draw and implement objects known as "orbs" the player is to collect, similarly to coins.
Task 106: Cause the player to transition to the next level once they have collected all of the orbs within the level.

$$$
User Story C
As a game player, I want the ability to gain a 1UP by collecting 20 coins in the game, so that I can have a way to replenish lives that I may have lost.
Task 107: Implement labels within the game that count the number of coins the player has collected, and how many lives they currently have.
Task 108: Increment the life counter by 1 every time the player collects 20 coins.  Also cause the coin counter to go back to 0.

User Story D
As a game player, I want an additional skin for my character, so that I can alter the cosmetic features of the game to suit my preferences.
Task 109: The player character's sprite shall look superficially different from the default sprite.

$$$
User Story E
As a game player, I want the game’s gravity to be approximately 80% of its default value, so that I can have greater control over my character’s momentum and movements.
Task 110: Decrease the game's gravity variable such that it is 80% of its current value.

User Story F
As a game player, I want an end state to be implemented into the game, so that I can know when the game is supposed to be over.
Task 111: Implement a "game over" screen that appears if the user hits 0 or fewer lives; restart the player at level 1.
Task 112: When the player has completed the final level, display a "you win" screen, similar to the "game over" screen.
