# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_game'
require_relative '../lib/tic_tac_toe_player'

puts '--- Tic-Tac-Toe ---'
#puts "Enter Player One Name: (X's)"
#p1 = Player.new(gets.chomp, 'X')
#puts "Enter Player Two Name: (O's)"
#p2 = Player.new(gets.chomp, 'O')
new_game = Game.new(Player, Player)
new_game.start_game
