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

    subject(:full_board) { described_class.new(Array.new(6) { Array.new(7, "\e[91m\u25CF\e[0m") }) }

    context 'when player picks a full column' do
      it 'returns false' do
        output = full_board.available_space?(2)
        expect(output).to be false
      end
    end
  end

  describe '#place_move' do
    subject(:new_board) { described_class.new }

    context 'when player picks an empty column' do
      it 'changes last row of column from blank to player token' do
        expect { new_board.place_move(2, "\e[91m\u25CF\e[0m") }.to change { new_board.board[5][2] }.from("\e[94m\u2423\e[0m").to("\e[91m\u25CF\e[0m")
      end
    end

    subject(:mid_board) { described_class.new }

    context 'when player picks a column mid game' do
      before do
        new_board.board[5][2] = "\e[91m\u25CF\e[0m"
      end

      it 'changes next available row from blank to player token' do
        expect { new_board.place_move(2, "\e[91m\u25CF\e[0m") }.to change { new_board.board[4][2] }.from("\e[94m\u2423\e[0m").to("\e[91m\u25CF\e[0m")
      end
    end
  end

  describe '#full?' do
    subject(:full_board) { described_class.new(Array.new(6) { Array.new(7, "\e[91m\u25CF\e[0m") }) }

    context 'when the game board is full' do
      it 'returns true' do
        output = full_board.full?
        expect(output).to be true
      end
    end

    subject(:new_board) { described_class.new }

    context 'when spaces on the board are still open' do
      it 'returns false' do
        output = new_board.full?
        expect(output).to be false
      end
    end
  end

  describe '#column_victory?' do
    subject(:win_board) { described_class.new }

    context 'when a player has 4 in a row in a column' do
      before do
        win_board.board[5][3] = "\e[91m\u25CF\e[0m"
        win_board.board[4][3] = "\e[91m\u25CF\e[0m"
        win_board.board[3][3] = "\e[91m\u25CF\e[0m"
        win_board.board[2][3] = "\e[91m\u25CF\e[0m"
      end

      it 'returns true' do
        output = win_board.column_victory?
        expect(output).to be true
      end
    end

    subject(:mid_board) { described_class.new }

    context 'when player only has 3 in a row in a column' do
      before do
        win_board.board[5][3] = "\e[91m\u25CF\e[0m"
        win_board.board[4][3] = "\e[91m\u25CF\e[0m"
        win_board.board[3][3] = "\e[91m\u25CF\e[0m"
      end

      it 'returns false' do
        output = mid_board.column_victory?
        expect(output).to be false
      end
    end
  end
end
