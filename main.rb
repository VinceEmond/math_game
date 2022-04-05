require './player'
require './mathquestion'
require './mathgame'

daryl = Player.new("Daryl")
jimmy = Player.new("Jimmy")
game = MathGame.new(daryl, jimmy)
game.play_game(daryl, jimmy)
