# frozen_string_literal: true

# Game class
class Game
    attr_accessor :player, :current_player_id
  
    WINNNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    MAX_TURNS = 8
  
    def initialize(player_one_class, player_two_class)
      @player = [Player.new('Player 1', 'X'), p2 = Player.new('Player 2', 'O')]
      @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      @current_player_id = 0
    end
  
    def start_game
      draw_game_board
      puts 'Player 1 moves first.'
      play_game
    end
  
    def play_game
      # while game_not_finished
      i = 0
      loop do
        # Players moves rotated by switching player id
        move = player[@current_player_id].play_move
        update_board(move, player[@current_player_id].marker)
        i += 1
        if player_won?(@current_player_id)
          puts "#{player[current_player_id].name} has won!"
          break
        elsif i == MAX_TURNS
          puts "It's a draw."
        end
        switch_player
      end
    end
  
    def update_board(move, char)
      @board[move] = char
      draw_game_board
    end
  
    def draw_game_board
      puts <<-HEREDOC 
          #{@board[1]} | #{@board[2]} | #{@board[3]}
         ---+---+---
          #{@board[4]} | #{@board[5]} | #{@board[6]}
         ---+---+---
          #{@board[7]} | #{@board[8]} | #{@board[9]} \n
      HEREDOC
    end
  
    def player_won?(player_id)
      WINNNING_COMBINATIONS.any? do |lines|
        lines.all? do |position|
          @board[position] == player[player_id].marker
        end
      end
    end
  
    def switch_player
      @current_player_id = other_player_id
    end
    
    def other_player_id
      1 - @current_player_id
    end
  end