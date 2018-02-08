def translate(phrase)
  pigLatin = phrase.split(' ').map do |word|
    if word[0].index(/[aeiou]/)
      pigLatin = "#{word}ay"
    else
      indexOfU = word.index('u')
      if indexOfU && word[indexOfU-1] == 'q'
        pigLatin = word[indexOfU+1..-1]+word[0..indexOfU] +"ay"
      else
        index = word.index(/[aeiou]/)
        pigLatin = word[index..-1]+word[0..index-1] +"ay"
      end
    end
  end
  pigLatin.join(' ')
end
