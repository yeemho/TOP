def bubble_sort_by(array) 
  
  (array.length - 2).times do
    for i in 0...(array.length-1) do
      left = array[i]
      right = array[i+1]
      compare = block_given? ? yield(left,right) : left - right 
      
      if compare > 0
        array[i] = right
        array[i+1] = left
      end  
    end
  end
  p array
end


bubble_sort_by([4,7,1,3,10,1]) do |a,b|
  b-a
end

bubble_sort_by([4,7,1,3,10,1]) do |a,b|
  a-b
end
