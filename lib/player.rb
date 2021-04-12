# frozen_string_literal: true

# Players
class Player
  def initialize(token = 'X')
    @token = token
  end

  def take_turn
    puts "\nPlayer #{@token}, what is your move?"
    move = gets.to_i
    validate_turn(move)
  end

  def validate_turn(move)
    until move >= 1 && move <= 7
      puts 'Pick an unfilled column between 1-7!'
      move = gets.to_i
    end
    move
  end
end
