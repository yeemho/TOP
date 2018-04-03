#Objects - methods
#Games - rounds, game ends when out of guesses OR correct guess
#Code - set, 4 colours (letters), feedback, 6 colour pegs
#Guesses - play, check, 12 guesses

module Mastermind
  
    def choose_player
      puts "Would you like to create or guess the code?"
      choice = gets.chomp
      return assign_roles(choice)
    end
    
    def assign_roles(human_choice)
      case human_choice
        when "guess"
          creator = Player.new("computer")
          guessor = Player.new("human")
        when "create"
          creator = Player.new("human")
          guessor = Player.new("computer")
        else
          puts "Choose either guess or create"
          choose_player
      end
      return { creator: creator, guessor: guessor }
    end
    
    def valid?
      if self.length == 4 && self.all? {|x| x.is_a? Integer}
        return true if self.min >= 1 && self.max <= 6
      end
      return false
    end
    
   
  class Player
    attr_reader :type
    def initialize(type)
      @type= type
    end
    
    def get_code
      case self.type
        when "human" then return get_input
        when "computer" then return Array.new(4){rand(1..6)}
      end
    end
    
    def get_input
      input = gets.chomp.split(',').map {|x| x.to_i}
      if input.valid?
        return input
      else
        puts "Invalid entry. Ensure you enter 4 numbers separated by commas, each from 1 to 6. Try again:"
        get_code
      end
    end
    
  end

    
  class Game
    
    def initialize(players)
      @creator = players[:creator]
      @guessor = players[:guessor]
      @moves = []
      @result = {}          
    end
    
    def play
      generate_secret_code
      until game_over do
        guess = get_guess
      end
      puts game_over + " Answer: #{@random_code}"
    end 
    
    def generate_secret_code
      puts "Enter your 4-digit secret code" if @creator.type == "human"
      @random_code = @creator.get_code
    end
    
    def get_guess
      puts "What is your guess?"
      input = @guessor.get_code
      play_guess(input)        
    end
    
    def play_guess(input)    
        @guess = Guess.new(input)
        @result = @guess.check_pattern(@random_code)
        feed_back(@guess, @result)      
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

puts "Welcome to Mastermind..."
puts "One player will decide the secret code (consisting of 4 numbers, each from 1 to 6). The other will have 12 rounds to break the code." 

players = choose_player
game = Game.new(players)
game.play

