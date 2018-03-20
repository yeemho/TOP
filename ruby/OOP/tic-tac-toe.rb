#Objects(nouns) - The game, the players, the cells
#Methods(verbs) - new game, new players, play, check status, show board 

#Logic:
  #Game starts - board with 9 empty cells is set up
  #New players - create 2 new players
  #Show board - shows the current board to players
  #Check status - checks to see if anyone has won OR it is a tie
  #Play - records play into the board
  #Next player - prompts the appropriate player to enter a play

module TicTacToe
  
    def all_same?
      return self[0] == self[1] && self[0] == self[2]
    end
  
  class Board
    def initialize
      #@grid = Array.new(3) { Array.new(3) }
      @grid = [["x",nil,"x"],[nil,"x",nil],[nil,nil,"x"]]
    end
    
    def get_index(position)
      mapping = {
        "1"=>[0,0],
        "2"=>[0,1],
        "3"=>[0,2],
        "4"=>[1,0],
        "5"=>[1,1],
        "6"=>[1,2],
        "7"=>[2,0],
        "8"=>[2,1],
        "9"=>[2,2]
      }
      return mapping[position]
    end
    
    def get_value(index_array)
      x = index_array[0]
      y = index_array[1]
      return @grid[x][y]
    end
    
    def none_empty?
      @grid.each {|row| 
        row.each { |item| return false if item.nil? }
      }
      return true
    end  
    
    def winning_combo
      @grid.each { |row| return true if row.all_same? }
      #diagonals
      diagonal_pos = [[1,5,9],[3,5,7]]
      diagonals = diagonal_pos.map {|array| 
        array.map {|pos| get_value(get_index(pos.to_s))}
        }
      diagonals.each {|array| return true if array.all_same?}
      return false
    end
    
  end
  
  
  class Game
    attr_reader :board
    def initialize (player1, player2)
      @board = Board.new
      @players = [player1,player2]
    end
        
    def game_over?
      @board.none_empty? 
    end
        
    def play
      get_move(player1)
    end

    def show
      @board.each {|row| p row}
    end  
    
    def get_move (player)
      puts "#{player.name}: Pick where to place your next move (number between 1 and 9)"
      move = gets.chomp
      play_move(move,player.marker)
    end
    
    def play_move(position,marker)
       
      x = @board.get_index(position)[0]
      y = @board.get_index(position)[1]
      
      if @board[x][y]
        puts "position has already been played"
        get_move
      else 
        @board[x][y] = marker
        show
      end
    end
    
  end

  class Player
    attr_reader :name, :marker
    @@markers = ["X","O"]
    def initialize(name)
      @name = name
      @marker = @@markers.pop
      puts "Welcome #{@name} your marker is '#{@marker}'"
    end
  end
  
end

include TicTacToe

puts "Player 1: Please enter your name."
player1 = Player.new(gets.chomp)
puts "Player 2: Please enter your name."
player2 = Player.new(gets.chomp)

game = Game.new(player1,player2)
p game.board.none_empty?
p game.board.winning_combo
