#Objects - methods
#Games - rounds, game ends when out of guesses OR correct guess
#Code - set, 4 colours (letters), feedback, 6 colour pegs
#Guesses - play, check, 12 guesses

module Mastermind
  
  class Game
    def initialize
      @code = Array.new(4) { rand(1..6) }
      puts "Welcome to Mastermind. Try to guess the secret pattern which consists of 4 numbers, each between 1 and 6." 
      puts "Enter your guess with each number separated by a comma. E.g. 1,2,3,4. You have 12 guesses."
    end
    
    def valid_guess?
      if @guess.length < 4
        puts "Guesses must have four numbers"
        get_guess
      else 
        return true
      end
    end
    
    def get_guess
      puts "What is your guess?"
      @guess = gets.chomp.split(',').map {|x| x.to_i }
      puts "valid" if valid_guess?
    end
    
    def play
      get_guess
    end
   
  end
  
  class Guess
    
  end

end

#computer sets up codeboard, generates a random secret pattern, saves it

#human player prompted to guess
#feedback given for the guess
include Mastermind

p game = Game.new
#game.play
game.get_guess
