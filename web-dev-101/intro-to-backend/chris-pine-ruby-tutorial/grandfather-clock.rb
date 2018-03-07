def grandfatherClock some_proc

  current_hour = Time.new.hour
  if current_hour == 0
    current_hour = current_hour + 12
  end 
  if current_hour > 12
    current_hour = current_hour - 12
  end
  
  current_hour.to_i.times do 
    some_proc.call
  end
  
end

dong_proc = Proc.new do
  puts 'DONG!'
end

grandfatherClock dong_proc
