# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#game_over?' do
    let(:full_board) { instance_double(Board) }
    subject(:game) { described_class.new(full_board) }

    context 'when game board is full' do
      before do
        allow(full_board).to recieve(:full?).and_return(true)
      end

      it 'returns true' do
        output = game.game_over?
        expect(output).to be true
      end
    end

    let(:win_board) { instance_double(Board) }
    subject(:won_game) { described_class.new(win_board) }

    context 'when a player has 4 in a row' do
      before do
        allow(win_board).to recieve(:column_victory?).and_return(true)
      end

      it 'returns true' do
        output = won_game.game_over?
        expect(output).to be true
      end
    end
  end
end
