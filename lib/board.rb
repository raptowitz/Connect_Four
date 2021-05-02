# frozen_string_literal: true

# Board
class Board
  attr_accessor :board

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

  def place_move(move, token)
    column = @board.reverse.transpose[move]
    row = column.find_index { |space| space == "\e[94m\u2423\e[0m" }
    @board[5 - row][move] = token
  end

  def tie?
    @board.flatten.none? { |space| space == "\e[94m\u2423\e[0m" }
  end
end

#\e[91m\u25CF\e[0m red
#\e[93m\u25CF\e[0m yellow
