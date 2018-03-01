puts "#6:"
File.open("hello_world.html","a") do |line|
  line.puts "<p>Hello World</p>"
end

File.open("favourite_animals.html","w") do |line|
  line.puts "<ul>"
  File.open("favourite_animals.txt").each do |animal|
    line.puts "<li>#{animal}</li>"
  end
  line.puts "</ul>"
end
    
