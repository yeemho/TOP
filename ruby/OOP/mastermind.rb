#Objects - methods
#Games - rounds, game ends when out of guesses OR correct guess
#Code - set, 4 colours (letters), feedback, 6 colour pegs
#Guesses - play, check, 12 guesses

module Mastermind
  
  class Game
    @@moves = []
    def initialize
      @random_code = [1,2,4,5]#Array.new(4) { rand(1..6) }
      puts "Welcome to Mastermind. Try to guess the secret pattern which consists of 4 numbers, each between 1 and 6." 
      puts "Enter your guess with each number separated by a comma. E.g. 1,2,3,4. You have 12 guesses."
    end
    
    def get_guess
      puts "What is your guess?"
      input = gets.chomp.split(',').map {|x| x.to_i } 
      Guess.new(input)
    end
    
    def play
      #until won? or round = 12 keep looping through
      guess = get_guess   
      result = guess.check_guess(@random_code)
      feed_back(guess, result)
    end 
    
    def feed_back (guess, result)
      @@moves.push("Round #{Guess.round}: #{guess.pattern} | Pegs: #{result[:red]} Red, #{result[:white]} White")
      puts "+++++++++++"
      puts "CODEBOARD"
      puts "+++++++++++"
      @@moves.each{|result| puts result}
    end
     
  end
  
  class Guess 
  
    attr_reader :red_pegs, :white_pegs, :pattern, :round
    @@round = 0
    def initialize(array)
      @pattern = array
      @@round += 1
    end   
    
    def self.round
      @@round
    end
    
    def check_guess(code)
      @red_pegs = 0
      @pattern.each_with_index { |x,i| 
        @red_pegs +=1 if x == code[i]
      }
      @white_pegs = (@pattern & code).length - @red_pegs
      return {red: @red_pegs, white: @white_pegs}
    end
  end

end

include Mastermind

game = Game.new
game.play
