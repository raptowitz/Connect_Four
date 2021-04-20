# frozen_string_literal: true

# Board
class Board
  def initialize(board = Array.new(6) { Array.new(7, "\e[94m\u2423\e[0m") })
    @board = board
  end

  def print
    @board.each do |row|
      puts row.join("\e[94m|\e[0m")
    end
  end

  def available_space?(move)
    @board[0][move] == "\e[94m\u2423\e[0m"
  end
end

#\e[91m\u25CF\e[0m red
#\e[93m\u25CF\e[0m yellow