def stockpicker(array)
  #can only sell after buying (only numbers to the right matter)
  #prices compare to prices within the array (nest another loop?)
  
  #take array of prices and start from first position. For each position
    #take each price to its right and find the difference of a price to the right
    #if difference is the largest so far, then assign max diff and save the buy index and sell index into result array
    #repeat for all prices except the last
  #return result
  
  optimal_days=[] #initialize result array
  
  max_profit = 0 #initialize maximum profit so far
  
  array.each_with_index {|price,index|  #iterate over array, assuming each iteration is the buy day
    buyprice = price
    buyday = index
    nextdays = array.drop(buyday) #the possible prices and days we can sell assuming a given buy price and day
    nextdays.each_with_index {|sellprice, sellday| 
      profit = sellprice - buyprice 
      if profit > max_profit
        max_profit = profit
        optimal_days= [buyday , sellday + buyday]
      end
    }
  }
  
  optimal_days
  
end

p stockpicker([9,19,8,3,4,5,6,7,8,1,19,0])
