# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'game'

loop do
  new_game = Game.new
  new_game.play_game
  break if new_game.play_again == false
end
