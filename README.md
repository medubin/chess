# Command Line Chess in Ruby

This is a command line game of chess written in Ruby for two players.


## How to run
To run clone the repo and run the command ruby chess.rb inside of the repo.


 ## Features
It supports most basic features of chess, including:
- Highlights allowable moves, removing the moves that would put or leave the current player in check.
- Pawn promotion.
- Automatic check for checkmate, ending the game and declaring a winner when it occurs.


## Design Choices
- Pieces use inheritance and mixins to DRY up movement logic.
- To check for legal moves the board is duplicated, the potential move is applied and the new board state is examined for check or checkmate

## Gameplay photos

### Pawns can move double on first move
![Pawn](/gameplay_photos/pawn_double.png)

### Pieces can capture opponents pieces
![Capture](/gameplay_photos/capture.png)

### Players can't self check
![Checkmate](/gameplay_photos/cant_self_check.png)
