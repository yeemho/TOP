def stock_picker(array)
  sorted = array.sort
  i_min = 0
  i_max = -1
  min = sorted[i_min]
  max = sorted[i_max]
  numbers = array[0..-1]
  
  index_count = {}
  
  array.each_with_index do |val , index|
    key = val
    value = index
    if !index_count.has_key?(key)
      index_count[key] = []
    end
    index_count[key].push(value)
  end
  
 while numbers.index(min) == -1 #check if occurs twice in array before removing value from tracking
  if index_count[min].length > 1 #check if the index of other instances are at edge case
    break
  else
    i_min += 1
    min = sorted[i_min]
    numbers = numbers[0...-1]
  end
 end
 

 while numbers.index(max) == 0 #check if occurs twice in array
  if index_count[max].length > 1
    break
  else 
    i_max -= 1
    max = sorted[i_max]
    numbers = numbers[1..-1] 
  end
 end
 
  min_ascend = min
  max_descend = max
 
 while index_count[max].max < index_count[min_ascend].min do
  i_min += 1
  min_ascend = sorted[i_min]
 end
 
 while index_count[max_descend].max < index_count[min].min do
  i_max -= 1
  max_descend = sorted[i_max]
 end
 
 range_ascend = max - min_ascend
 range_descend = max_descend - min
 
 min = range_ascend > range_descend ? min_ascend : min
 max = range_ascend > range_descend ? max : max_descend

 return [index_count[min].min,index_count[max].max]

end

p stock_picker([17,16,15,16,3,6,9,15,16,3,8,6,10,2,1])

=begin

edge case, when the max number occurs before AND after the min number
loop through and save duplicate indicies into a set

=end


