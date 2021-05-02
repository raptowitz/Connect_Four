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

  def full?
    @board.flatten.none? { |space| space == "\e[94m\u2423\e[0m" }
  end

  def column_victory?
    moves = @board.transpose.flatten
    victory = [moves[0]]
    until moves.empty?
      moves.shift
      victory.clear if victory[0] != moves[0] || victory[0] == "\e[94m\u2423\e[0m"
      victory.push(moves[0])
      break if victory.length == 4
    end
    victory.length == 4
  end
end

#\e[91m\u25CF\e[0m red
#\e[93m\u25CF\e[0m yellow
