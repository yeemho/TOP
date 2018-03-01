puts "#1:"
puts "Hello World"

puts "#2:"
File.open('favourite_animals.txt').each do |line|
  puts line
end

puts "#3:"
puts "What is your favourite animal?"
animal = gets.chomp
puts "Your favourite animal is #{animal}."

puts "#4:"
puts "What would you like to look up?"
input = gets.chomp
if input == "favourite animals"
  File.open('favourite_animals.txt').each do |line|
    puts line
  end
else
  puts "No such file"
end

puts "#5:"
File.open("hello_world.txt","a") do |line|
  line.puts "Hello World"
end

