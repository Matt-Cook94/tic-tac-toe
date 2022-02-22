# frozen_string_literal: true

# Player class
class Player
    attr_accessor :name, :marker
  
    def initialize(name, marker)
      @name = name
      @marker = marker
    end
  
    def play_move
      puts "#{name}'s turn. Please enter a number:"
      gets.chomp.to_i
    end
  end