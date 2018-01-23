class OrangeTree
  
  def initialize name
    @name = name
    @age = 0
    @orangeCount = 0
    @height = 0
    puts 'You planted an orange tree named ' + @name
  end
  
  def height
    @height
  end
  
  def water
    oneYearPasses
  end
  
  def oneYearPasses
    @orangeCount = 0
    if @age < 2
      @age = @age + 1
      puts 'Your tree '+ @name +' cannot produce fruit yet. Keep watering it.'
    elsif @age < 5
      @age = @age + 1
      @orangeCount = @orangeCount + 2
      puts 'Your tree '+ @name +' has oranges for picking!'
    elsif @age <10
      @age = @age + 1
      @orangeCount = @orangeCount + 5
      puts 'Your tree '+ @name +' has produced a lot of fruit!'
    else
      puts 'Your orange tree '+ @name +' has died of old age :('
    end    
  end
  
  def countTheOranges
    @orangeCount
  end
  
  def pickAnOrange
    if @orangeCount > 0
      @orangeCount = @orangeCount - 1
      puts 'That orange was delicious!'
    else
      puts 'No oranges to pick'
    end
  end
  
end

tree = OrangeTree.new "Twiggy"
tree.countTheOranges
tree.water
tree.water
tree.water
tree.water
tree.water
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.water
tree.countTheOranges
tree.pickAnOrange
5.times do
  tree.water
end

