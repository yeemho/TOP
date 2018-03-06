=begin 
Define a function that takes 2 parameters, string and shift factor
convert string into an array (ordered)
Apply each method to array with code that shifts letters by the factor then adds it to output string
block
  check the ASCII code to see if within range of lowercase a-z
    if charactercode + shift factor is not in range, then adjust for wrapping
  else check if code is within range of uppercase A-Z
    check if code + shift factor is within range, otherwise adjust for wrapping    
  otherwise, leave character (spaces and punctuation) as is
=end

def caesars_cipher(string,factor)
  output = [];
  letters = string.split('')
  
  letters.each do |letter|
    if ("a".."z") === letter || ("A"..."Z") === letter
      factor.times do
        letter = letter.next
      end
    end
    output.push(letter[-1])
  end
  puts output.join('')
end

caesars_cipher("What a string!",5)
