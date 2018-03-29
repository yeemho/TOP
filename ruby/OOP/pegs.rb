def check_pattern(guess,code)
  red = 0
  guess.each_with_index {|x,i| 
    red += 1 if x == code[i]
  }
  a = guess.reject.with_index {|x,i| x == code[i]}
  b = code.reject.with_index {|x,i| x == guess[i]}
  
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
  p red
  p white = 4 - red - a.length
end

check_pattern([6,4,5,5],[4,4,4,5])

