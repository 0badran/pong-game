# 🏓 Pong Game
## My CS50 final project
### Video Demo:  https://youtu.be/4mnmx-lm-rY
### 💡 Description:
It is a two-player game where two players compete to score the most goals against each other. To make the pace of the game a little more difficult, I accelerated the ball's movement when it hit the wall, up and down, by 5% of the ball's current speed. I tried to include a single-player mode and add an AI option, but since I don't have all the knowledge, I used a simple algorithm that reverses the ball's position with a negative or positive number. 🔦 A quick cheat while playing. The closer the ball is to the 90-degree angle when hitting the wall, the less the bounce:)

### - 👨🏻‍💻 About project
- This game has been made with Lua and LÖVE engine.

### About files structure
main.lua: Contains instructions for merging project file parts to create the visual part of the game;

ball.lua: Creates a Ball object with properties and methods to control its movement, collision, and drawing;

paddle.lua: Creates a new Paddle object with given x, y coordinates and side ('l' for left, 'r' for right);

score.lua: Creates a new Score object;

button.lua: Creates a new Button object with given x, y coordinates and text for button;

conf.lua: Configures the game window properties;

font: Inside this folder there is the font used;

image: Used image for background game image & file;

video: This folder has the video of the game menu;

sound: Inside this folder we can found the background sound used in the game;

##
![md gallery](/image/md-gallery.gif)
