# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#available_space?' do
    subject(:new_board) { described_class.new }

    context 'when player picks an unfilled column' do
      it 'returns true' do
        output = new_board.available_space?(1)
        expect(output).to_be true
      end
    end

    subject(:mid_board) { described_class.new(Array.new(6) { Array.new(7, "\e[44m b \e[0m") }) }

    context 'when player picks a full column' do
      it 'returns false' do
        output = mid_board.available_space?(2)
        expect(output).to_be false
      end
    end
  end
end