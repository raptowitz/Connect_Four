# frozen_string_literal: true

# Game
class Game
  def initialize(board = Board.new, player1 = Player.new("\e[91m\u25CF\e[0m"), player2 = Player.new("\e[93m\u25CF\e[0m"))
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def play_game
    @board.print
    until game_over?
      player_move(@player1)
      break if game_over?

      player_move(@player2)
    end
    display_results
  end

  def game_over?
    @board.full? || @board.column_victory? || @board.row_victory? || @board.diagonal_victory?
  end

  def player_move(player)
    move = player.take_turn
    move = player.take_turn until @board.available_space?(move)
    @board.place_move(move, player.token)
    puts "\e[H\e[2J"
    @board.print
  end

  def display_results
    if @board.full?
      puts 'Tie!'
    else
      puts 'Victory!'
    end
  end
end
