NOTE: $$$ above a task means that the task has been completed; this is just a way to emphasize that.

$$$
User Story A<br>
Status: Completed<br>
Assigned to William Wood<br>
Points: 4<br>
As a game player, I want a title screen to be implemented before the game start so that I can choose when to start or exit the game.<br>
$$$ Task 001: Implement a title screen that displays the title of the game, a "play game" button, and an "exit" button. (2 pts.)<br>
$$$ Task 002: Implement a system in which clicking on the "play game" button begins Level 1. (1 pt.)<br>
$$$ Task 003: Implement a system in which clicking on the "exit" button that exits the game. (1 pt.)<br>

User Story B<br>
Status: Assigned<br>
Assigned to Jeremy Hall<br>
Points: 12<br>
As a game player, I want at least one new level in the game so that I can have a newer and longer experience with the game.<br>
$$$ Task 004: Edit the current level background provided with the game such that at least one new color scheme is produced for the new levels. (3 pts.)<br>
Task 005: Design and implement at least one different level to be implemented after the first (default level). (8 pts.)<br>
Task 006: Implement level transitions such that the player plays the levels sequentially (L1 -> L2 -> L3) (1 pt.)<br>

$$$
User Story C<br>
Status: Completed<br>
Assigned to Mathew Bagwell<br>
As a game player, I want some cosmetic changes added to the game so that I can feel that the game's presentation is sharper and more professional.<br>
Points: 24<br>
$$$ Task 007: Adjust the player's gravity such that it is about 80% of its current value. (1 pt.)<br>
$$$ Task 027: Give the player the ability to hover(button). (5 pt.)<br>
$$$ Task 028: Make the hover function maintain height, while going left to right. (2 pt.)<br>
$$$ Task 029: Change the bullet's color and set gravity to zero(for bullet). (3 pt.)<br>
$$$ Task 030: Make the user's laser automatic(4 shots per second). (5 pt.)<br>
$$$ Task 031: Make the sky fade to darkness then back over time. (5 pt.)<br>
$$$ Task 033: Make the enemies move around and jump at various speeds/intervals. (3 pt.)<br>

User Story D<br>
Status: Assigned<br>
Assigned to Reid Wynkoop<br>
Points: 14<br>
As a game player, I want the game to keep track of the number of items I have collected, so that I can guage my progress towards completing the game.<br>
$$$ Task 008: Implement a coin and life counter that indicates how many coins and lives the player currently has. (5 pts.)<br> 
$$$ Task 009: Cause the user's life counter to go down by 1 should the player die (2 pts.)<br>
$$$ Task 010: Add a "you died" screen when players life reaches 0 (2 pts.)<br>
$$$ Task 023: Implement a "game over" screen when the number of lives hits 0. (2 pts.)<br>
$$$ Task 032: When the player dies, reset their coins and orbs to 0. Also reset the coins' and orbs' positions in the level (3 pts.)

$$$
User Story E<br>
Status: Assigned<br>
Assigned to Jeremy Hall<br>
Points: 1<br>
As a game player, I want a set of instructions to be included with the game's code, so that I can be familiar with how the game and its mechanisms operate.<br>
$$$ Task 011: Include a .txt file within the game's files called "README" that explains the controls of the game. (1 pt.)
  * Note: This file will be included in both the 2D folder in the engine, and in this repository for ease of access.<br>

$$$
User Story F<br>
Status: Completed<br>
Assigned to Saleh Alsadoon<br>
Points: 12<br>
As a game player, I want the ability to change the player character's appearance so that I can have more fun in customizing my own experience with the game.<br>
$$$ Task 012: Reduce The game gravity. (1 pt.)<br>
$$$ Task 013: Change charcter skin of the player (5 pt.)<br>
$$$ Task 014: Add animation to the new skin (3 pt.)<br>
$$$ Task 015: Add powerup. (3 pt.)<br>

User Story G<br>
Status: Assigned<br>
Assigned to Jeremy Hall<br>
Points: 11<br>
As a game player, I want the ability to progress to the next level after completing a certain condition so that I can progress through the game.<br>
$$$ Task 016: Create a PNG image to serve as a collectible orb within the game. (1 pt.)<br>
$$$ Task 017: Add collision detection with the orb sprite, similar to with coins and enemies. (2 pts.)<br>
$$$ Task 018: Modify the game's code such that the game keeps track of how many orbs the player has obtained. (3 pts.)<br>
Task 019: Warp to player to the next level when the orb counter in Task 018 reaches 4 (will require Tasks 004-006 to be completed). (5 pts.)<br>
NOTE: These tasks advance the goal of implementing and completing Feature #7 of features.md: Implement an end state to the game.

$$$
User Story H<br>
Status: Complete<br>
Assigned to Jeremy Hall<br>
Points: 1<br>
As a game developer, I want to invite other people (especially the instructor and the grader) to review my project so that I can receive the feedback and information necessary to complete the tasks expected of me.<br>
$$$ Task 020: Send friend requests to Buck, Nino, and Rob Noonan on GitHub so that they may follow the project's progress. (1 pt.)<br>

User Story I<br>
Status: In progress<br>
Assigned to Everyone<br>
Points: 5<br>
As a software developer, I want to both leave feedback and receive feedback from the other members of my team so that I can gauge my progress towards how close to completion the project is, and also so that I can make any changes necessary to improve the product.<br>
Task 024: Leave at least three sentences' worth of feedback on at least 10 different pull requests initiated by team members. (2 pts.) <br>
Task 025: Initiate any combination of at least 20 pull requests and meaningful commits on the godot-demo-projects repo.<br>
NOTE: Meaningful in this case means the contribution took at least 3-5 minutes of work. (3 pts.)

User Story J<br>
Status: Assigned<br>
Assigned to whoever wants it (TBD)<br>
Points: 2<br>
As a game player, I want the game to kill my player character and reset them at the starting point of the level if I fall off of the map, so that I can continue to play the game without the game entering a soft-locked state.<br>
Task 026: Decrease the player's life counter by 1 if the player character's sprite falls below a certain height. (2 pts.) <br>
