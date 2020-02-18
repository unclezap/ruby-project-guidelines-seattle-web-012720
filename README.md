How to run this file:
==============================
1.  Clone this repo
2.  From your terminal, run bundle install.
    * You may encounter errors at this point.  If this happens, try deleting your Gemlock file and running bundle install again.
3.  Create your database tables.  To do this, simply run rake db:migrate in the terminal.
4.  Seed your database with card values.  This can be accomplished by running rake db:seed from the terminal.
5.  To start the application, type in "ruby 'bin/run.rb' in the terminal from the top-level file directory of this project.

Note: this project must be played from a Mac computer running a recent OS.


What does this program do?
==============================
This program plays a text version of the game Set, as well as provides data on player performance in the game.


How to play Set
==============================
In the game set, you are presented with 12 or more cards that have shapes on them with four different qualities (number, color, shape, and shading). These qualities are represented in this game by three text symbols printed in one of three colors:

1 A @

2 B #

etc.

Your task is to identify three "cards" that, for each quality, are either all matching or all different.  Three such cards are known as a "set."  Here is an example set:

1 A @     2 A #     3 A $

The first and third qualities (the numbers and symbols) are different for each card, while the second quality (the letter) remains the same for each.  For this example, assume that the colors of each card are also either all different or all the same.

The following is not a set because the number qualities are the same for the first two cards, but different from the third:

1 A @    1 B @      3 C @

You can find an example set by selecting item 6. Example of a set from the startup menu of the game.


How to play this game
==============================
Select option 1. Play a game from the startup menu.  If you are a new player, you will be asked to create player profile and a tagline.  This tagline will be used to verify you for future games and to delete your player data if desired.

From here, you will be asked to select a difficulty level.  Difficulty levels control how much time a player is alloted to select a set from the available cards.  A custom difficulty level function is also allowed for players who desire harder or easier games than allowed by the basic difficulty levels.

Once you begin play, you can collect sets by entering three keys corresponding with card locations.  The first row of cards can be taken by typing the corresponding letter on the QWER row of the keyboard.  The second row corresponds to the ASDF keys and the third row corresponds to the ZXCV keys.  If a fourth row is added, these cards can be selected with the UIOP keys.  Here is a visual reference:

Q (first row, leftmost card)   W (first row, second leftmost card)   E (first row, second rightmost card)  R (first row, rightmost card)

A (second row, leftmost card)   S (second row, second leftmost card)   D (second row, second rightmost card)  F (second row, rightmost card)

Z (third row, leftmost card)   X (third row, second leftmost card)   C (third row, second rightmost card)  V (third row, rightmost card)

U (fourth row, leftmost card)   I (fourth row, second leftmost card)   O (fourth row, second rightmost card)  P (fourth row, rightmost card)

Other functions:
==============================
The high score menu (option 2. View high score from the startup menu) allows players to view the highest score achieved in the game, as well as the total number of games played in your copy of the game.  Further statistical analysis will be available in future versions of the game.

The delete records menu (option 3. Delete records from the startup menu) allows players to delete their own player profiles or individual games they have played from the database.

The change tagline menu (option 4. Change your tagline from the startup menu) allows players to change their taglines.  Players must know their taglines in order to change them.

Special thanks and contributors:
==============================
Special thanks for this project goes to the creator of the Ruby gem "colorize," Michał Kalbarczyk, without whom this project would not be possible or, at least, gameplay would be more difficult.

Future versions of this project will take advantage of the gems "rmagick" (created by Tim Hunter, Omer Bar-or, Benjamin Thomas, Moncef Maiza) and "catpix" (created by Radek Pazdera).  Thanks in advance to these creators.

Screenshots
==============================
![Image description](https://github.com/unclezap/ruby-project-guidelines-seattle-web-012720/blob/master/Screen%20Shot%202020-02-18%20at%201.41.57%20PM.png?raw=true)

Gameplay

![Image description](https://github.com/unclezap/ruby-project-guidelines-seattle-web-012720/blob/master/Screen%20Shot%202020-02-18%20at%201.42.43%20PM.png?raw=true)

Startup menu

License
==============================
This project is licensed under the GNU GPL at https://www.gnu.org/licenses/gpl-3.0.en.html.
