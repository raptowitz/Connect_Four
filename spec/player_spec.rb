# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#validate_turn' do
    subject(:player) { described_class.new }

    context 'when player picks a valid column' do
      before do
        valid_input = 1
        allow(player).to receive(:gets).and_return(valid_input)
      end

      it 'stops loop and does not display instructions' do
        instructions = 'Pick an unfilled column between 1-7!'
        expect(player).not_to receive(:puts).with(instructions)
        player.validate_turn
      end
    end

    context 'when player picks a valid column, then an invalid column' do
      before do
        valid_input = 2
        invalid_input = 9
        allow(player).to receive(:gets).and_return(valid_input, invalid_input)
      end
      it 'completes loop and display instructions once' do
        instructions = 'Pick an unfilled column between 1-7!'
        expect(player).to receive(:puts).with(instructions).once
        player.validate_turn
      end
    end
  end
end
