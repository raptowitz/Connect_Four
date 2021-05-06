# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  describe '#play_game' do
    let(:board) { instance_double(Board) }
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }
    subject(:end_game) { described_class.new(board, player1, player2) }

    context 'when game is over' do
      before do
        allow(game).to receive(:game_over?).and_return(true)
      end

      it 'stops loop and displays results' do
        expect(end_game).to receive(:display_results)
        end_game.play_game
      end
    end
  end

  describe '#game_over?' do
    let(:full_board) { instance_double(Board) }
    subject(:tie_game) { described_class.new(full_board) }

    context 'when game board is full' do
      before do
        allow(full_board).to receive(:full?).and_return(true)
      end

      it 'returns true' do
        output = tie_game.game_over?
        expect(output).to be true
      end
    end

    let(:win_board) { instance_double(Board) }
    subject(:won_game) { described_class.new(win_board) }

    context 'when a player has 4 in a row' do
      before do
        allow(win_board).to receive(:full?).and_return(false)
        allow(win_board).to receive(:column_victory?).and_return(true)
      end

      it 'returns true' do
        output = won_game.game_over?
        expect(output).to be true
      end
    end

    let(:mid_board) { instance_double(Board) }
    subject(:mid_game) { described_class.new(mid_board) }

    context 'when the game is not over' do
      before do
        allow(mid_board).to receive(:full?).and_return(false)
        allow(mid_board).to receive(:column_victory?).and_return(false)
        allow(mid_board).to receive(:row_victory?).and_return(false)
        allow(mid_board).to receive(:diagonal_victory?).and_return(false)
      end

      it 'returns false' do
        output = mid_game.game_over?
        expect(output).to be false
      end
    end
  end

  describe '#player_move' do
    let(:player1) { instance_double(Player, token:'X') }
    let(:board) { instance_double(Board) }
    subject(:game) { described_class.new(board, player1) }

    context 'when player picks a full column once' do
      before do
        allow(board).to receive(:available_space?).and_return(false, true)
        allow(player1).to receive(:take_turn).and_return(1, 2)
        allow(board).to receive(:place_move).with(2, 'X')
      end

      it 'sends take turn to player twice' do
        expect(player1).to receive(:take_turn).twice
        game.player_move(player1)
      end
    end
  end
end
