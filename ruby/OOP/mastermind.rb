#Objects - methods
#Games - rounds, game ends when out of guesses OR correct guess
#Code - set, 4 colours (letters), feedback, 6 colour pegs
#Guesses - play, check, 12 guesses

module Mastermind
  
    def valid?
      if self.all? {|x| x.is_a? Integer}
        return true if self.min >= 1 && self.max <= 6
      end
      return false
    end
    
  class Game
    
    def initialize
      @random_code = [6,4,4,5] #Array.new(4) { rand(1..6) }
      @moves = []
      @result = {}
      puts "Welcome to Mastermind..."
      puts "Try to guess the secret code which consists of 4 numbers, each from 1 to 6." 
      puts "Enter your guess with each number separated by a comma. E.g. 1,2,3,4. You have 12 guesses."
    end
    
    def get_guess
      puts "What is your guess?"
      input = gets.chomp.split(',').map {|x|   
        x.to_i 
      }
      play_round(input)        
    end
    
    def play_round(input)
    
      if input.valid?
        @guess = Guess.new(input)
        @result = @guess.check_pattern(@random_code)
        feed_back(@guess, @result)
      else
        puts "Invalid guess, ensure you enter 4 numbers, each from 1 to 6."
        get_guess
      end
      
    end
    
    def play
      until game_over do
        guess = get_guess
      end
      puts game_over + " Answer: #{@random_code}"
    end 
    
    def feed_back (guess, result)
      @moves.push("Round #{Guess.round}: #{guess.pattern} | Pegs: #{result[:red]} Red, #{result[:white]} White")
      puts "+++++++++++"
      puts "CODEBOARD"
      puts "+++++++++++"
      @moves.each{|result| puts result}
    end
    
    def game_over
     return "You cracked the code!" if won?
     return "Game over." if Guess.round >= 12
     return false
    end
    
    def won?
      return @result[:red] == 4
    end
     
  end
  
  class Guess 
  
    attr_reader :pattern, :round
    @@round = 0
    def initialize(array)
      @pattern = array
      @@round += 1
    end   
    
    def self.round
      @@round
    end
    
    def check_pattern(code)
      red_pegs = 0
      self.pattern.each_with_index {|x,i| 
        red_pegs += 1 if x == code[i]
      }
      a = self.pattern.reject.with_index {|x,i| x == code[i]}
      b = code.reject.with_index {|x,i| x == self.pattern[i]}
  
      until a & b == [] do
        a.each_with_index{|x,i|
          b.each_with_index{|y,j| 
            if x == y
              a.delete_at(i)
              b.delete_at(j)
              break
            end
          }
        } 
      end
      white_pegs = 4 - red_pegs - a.length
      return { red: red_pegs, white: white_pegs}
    end
    
  end
end

include Mastermind

game = Game.new
game.play
