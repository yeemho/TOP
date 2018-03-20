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
      return self[0] == self[1] && self[0] == self[2] && self[0]
    end
  
  class Board
    attr_reader :grid
    def initialize
      @grid = Array.new(3) { Array.new(3) }
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
    
    def check_win(position_array)
        values = position_array.map {|array| 
          array.map {|pos| get_value(get_index(pos.to_s))}
        }
        values.each {|array| return true if array.all_same?}
        return false
    end
    
    def winning_combo?
      column_pos = [[1,4,7],[2,5,8],[3,6,9]]
      diagonal_pos = [[1,5,9],[3,5,7]]
      #rows
      self.grid.each { |row| return true if row.all_same? }      
      return true if check_win(column_pos)
      return true if check_win(diagonal_pos)
      
      
      #diagonals = diagonal_pos.map {|array| 
       # array.map {|pos| get_value(get_index(pos.to_s))}
        #}
      #diagonals.each {|array| return true if array.all_same?}
      #return false
    end
    
  end
  
  
  class Game
    attr_reader :board
    def initialize (player1, player2)
      @board = Board.new
      @player1 = player1
      @player2 = player2
    end
        
    def game_over?
      return "won" if @board.winning_combo?
      return "tie" if @board.none_empty?
      return false
    end
        
    def play
      p game_over?
      until game_over? do
        get_move(@player1)
        return "Game over, #{@player1.name} has won!" if @board.winning_combo?
        return "Game over, it is a tie" if @board.none_empty?
        if !game_over?
          get_move(@player2) 
          return "Game over, #{@player1.name} has won!" if @board.winning_combo?
          return "Game over, it is a tie" if @board.none_empty?
        end
      end
    end

    def show
      @board.grid.each {|row| p row}
    end  
    
    def get_move (player)
      puts "#{player.name}: Pick where to place your next move (number between 1 and 9)"
      move = gets.chomp
      play_move(player,move,player.marker)
    end
    
    def play_move(player,position,marker)
       
      index = @board.get_index(position)
      x,y = index[0],index[1]
      
      if @board.grid[x][y]
        puts "Position has already been played. Pick again"
        get_move(player)
      else 
        @board.grid[x][y] = marker
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
p game.play

