# frozen_string_literal: true

# Game
class Game
  def initialize(board = Board.new, player1 = Player.new("\e[91m\u25CF\e[0m"), player2 = Player.new("\e[93m\u25CF\e[0m"))
    @player1 = player1
    @player2 = player2
    @board = board
  end
end
