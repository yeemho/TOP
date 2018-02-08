def echo(phrase)
  phrase.to_s
end

def shout(phrase)
  "#{phrase.upcase}"
end

def repeat(phrase,times=2)
  string = ''
  while times > 0
    string = string + " #{phrase}"
    times = times - 1
  end
  string.strip
end

def start_of_word(word,index)
  word[0..index-1]
end

def first_word(phrase)
  phrase.split[0]
end

def titleize(phrase)
  exclusions = ["and", "or", "the", "over", "to", "the", "a", "but","in","of","an"]
  words = phrase.split.map {|word| exclusions.include?(word) ? word : word.capitalize }
  words[0].capitalize!
  words.join(' ')
end
