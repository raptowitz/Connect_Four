# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#available_space?' do
    subject(:new_board) { described_class.new }

    context 'when player picks an unfilled column' do
      it 'returns true' do
        output = new_board.available_space?(1)
        expect(output).to be true
      end
    end

    subject(:end_board) { described_class.new(Array.new(6) { Array.new(7, "\e[91m\u25CF\e[0m") }) }

    context 'when player picks a full column' do
      it 'returns false' do
        output = end_board.available_space?(2)
        expect(output).to be false
      end
    end
  end
end