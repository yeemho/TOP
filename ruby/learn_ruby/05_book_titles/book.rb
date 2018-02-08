class Book
  
  def title
    @title
  end
  
  def title=(phrase) #could try to require simon says file and then use the titleize method?
    exclusions = ["and", "or", "the", "over", "to", "the", "a", "but","in","of","an"]
    words = phrase.split.map {|word| exclusions.include?(word) ? word : word.capitalize }
    words[0].capitalize!
    @title = words.join(' ')
  end
  
end
