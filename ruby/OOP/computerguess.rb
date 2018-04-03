def computer_guess (prev_guess,secret_code)
    return prev_guess.map.with_index {|x,i| 
      x == secret_code[i] ? x : rand(1..6)
    }   
end

def evaluate_guess(this_guess,secret_code)
  correct = 0
  this_guess.each_with_index {|x,i| correct += 1 if x == secret_code[i]}
  return correct
end


p guess = Array.new(4) {rand(1..6)}

until evaluate_guess(guess,[1,2,3,4]) == 4
  p guess = computer_guess(guess,[1,2,3,4])
end

