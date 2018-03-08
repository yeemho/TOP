
def bubble_sort(array)
  (array.length-2).times do 
     for i in 0...(array.length - 1) do 
        a = array[i]
        b = array[i+1]
        
        if a > b
          array[i] = b
          array[i+1] = a
        end
        
     end
   end
   array
end

p bubble_sort([3,7,8,2,1,4,5])
