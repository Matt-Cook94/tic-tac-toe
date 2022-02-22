# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_game'
require_relative '../lib/tic_tac_toe_player'

describe Game do
  subject(:game) { described_class.new(Player, Player) }

  describe '#initialize' do
    context 'when game is initialized' do
      it 'has current player id of 0' do
        player_id = game.current_player_id
        expect(player_id).to eql(0)
      end
    end
  end
  
  describe '#start_game' do
    # No need to test, test methods inside.
  end

  describe '#play_game' do
    # No need to test
  end

  describe '#update_board' do
    subject(:game_move) { described_class.new(Player, Player) }

    context 'when board recieves move from player one' do
      it 'updates board position with X' do
        move_position = 1
        char = 'X'
        game_move.update_board(move_position, char)
        board = game_move.instance_variable_get(:@board)
        expect(board[move_position]).to eq('X')
      end
    end

    context 'when board recieves move from player two' do
      it 'updates board position with O' do
        move_position = 3
        char = 'O'
        game_move.update_board(move_position, char)
        board = game_move.instance_variable_get(:@board)
        expect(board[move_position]).to eq('O')
      end
    end
  end

  describe '#player_won?' do
    context 'when player one has 3 Xs horizontally' do
      subject(:game_move) { described_class.new(Player, Player) }

      before do
        game_move.instance_variable_set(:@board, [0, 'X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      end

      it 'is game over' do
        player_one = 0
        expect(game_move.player_won?(player_one)).to be true
      end
    end

    context 'when player has 3 Xs vertically' do
      subject(:game_move) { described_class.new(Player, Player) }

      before do
        game_move.instance_variable_set(:@board, [0, 'X', 2, 3, 'X', 5, 6, 'X', 8, 9])
      end

      it 'is game over' do
        player_one = 0
        expect(game_move.player_won?(player_one)).to be true
      end
    end

    context 'when player has 3 Xs diagonally' do
      subject(:game_move) { described_class.new(Player, Player) }

      before do
        game_move.instance_variable_set(:@board, [0, 1, 2, 'X', 4, 'X', 6, 'X', 8, 9])
      end

      it 'is game over' do
        player_one = 0
        expect(game_move.player_won?(player_one)).to be true
      end
    end

  end

  describe '#switch_player' do
    context 'when turn is finished' do
      subject(:player) { described_class.new(Player, Player) }
      
      it 'switches players' do
        player.switch_player
        player_id = player.current_player_id
        expect(player_id).to eql(1)
      end
    end
  end

    
end
