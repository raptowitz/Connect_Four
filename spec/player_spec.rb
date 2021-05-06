# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#validate_turn' do
    subject(:player) { described_class.new }

    context 'when player picks a valid column' do
      it 'stops loop and does not display instructions' do
        instructions = 'Pick an unfilled column between 0-6!'
        expect(player).not_to receive(:puts).with(instructions)
        player.validate_turn(1)
      end
    end

    context 'when player picks an invalid column, then a valid column' do
      before do
        valid_input = 2
        allow(player).to receive(:gets).and_return(valid_input)
      end

      it 'completes loop and display instructions once' do
        instructions = 'Pick an unfilled column between 0-6!'
        expect(player).to receive(:puts).with(instructions).once
        player.validate_turn(9)
      end
    end
  end
end
