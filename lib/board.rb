# frozen_string_literal: true

# Board
class Board
  def initialize(blank = "\e[94m\u2423\e[0m", board = Array.new(6) { Array.new(7, blank) })
    @board = board
    @blank = blank
  end

  def print
    @board.each do |row|
      puts row.join("\e[94m|\e[0m")
    end
    puts '0 1 2 3 4 5 6'
  end

  def available_space?(move)
    @board[0][move] == @blank
  end

  def place_move(move, token)
    column = @board.reverse.transpose[move]
    row = column.find_index { |space| space == @blank }
    @board[5 - row][move] = token
  end

  def full?
    @board.flatten.none? { |space| space == @blank }
  end

  def column_victory?
    moves = @board.transpose.flatten
    four_in_a_row?(moves)
  end

  def row_victory?
    moves = @board.flatten
    four_in_a_row?(moves)
  end

  def diagonal_victory?
    victory = false
    @board.each_with_index do |row, row_num|
      row.each_with_index do |column, column_num|
        next if column == @blank || row_num + 3 > 5

        if column == @board[row_num + 1][column_num + 1] && column == @board[row_num + 2][column_num + 2] && column == @board[row_num + 3][column_num + 3] ||
           column == @board[row_num + 1][column_num - 1] && column == @board[row_num + 2][column_num - 2] && column == @board[row_num + 3][column_num - 3]
          victory = true
        end
      end
    end
    victory
  end

  private

  def four_in_a_row?(moves)
    victory = [moves[0]]
    until moves.empty?
      moves.shift
      victory.clear if victory[0] != moves[0] || victory[0] == @blank
      victory.push(moves[0])
      break if victory.length == 4
    end
    victory.length == 4
  end
end

#\e[91m\u25CF\e[0m red
#\e[93m\u25CF\e[0m yellow
