
def substrings(phrase, dictionary)
  word_count = {}
  
  words = phrase.gsub(/[[:punct:]]/,'').downcase.split(' ')
  words.collect do |word|
    dictionary.collect do |x|
      expression = /#{x}/
      if !expression.match(word).nil?
        word_count[x] = 0 if word_count[x].nil?
        word_count[x] += 1
      end
    end
  end
   return word_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
