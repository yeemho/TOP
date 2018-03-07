#loop through each price on buy day i
      #loop through all following days (potential sell days) and find the difference -> save it into profit_by_sellday object. 
      #End loop
      #take the sell_day:profit k-v pair from profit_by_sellday object and save it into profit_by_buyday[buy_day] = {sell_day:profit}
    #end loop
    #take the buy and sell days with max profit
    #If max profit is positive then result will equal these days of trade
    #otherwise result is nil (no profitable trades)
    
def stock_picker(prices)
  if prices.length < 2
    result = nil
  elsif prices.max == prices.min 
    result = nil
  else
    result = optimal_profit(prices)
  end 
  result
end

def optimal_profit(prices)
  max_day = prices.index(prices.max)
  min_day = prices.index(prices.min)
    
  if max_day > min_day
    result = [min_day,max_day]
  else
    profits = {}
    for i in 0..(prices.length-2) do
      profits_by_sellday = {}
      for j in (i+1)..(prices.length-1) do
        profits_by_sellday[j] = prices[j] - prices[i]
      end
      max_profit_by_buyday = profits_by_sellday.select {|key,val| val == profits_by_sellday.values.max && val > 0}
      profits[i] = max_profit_by_buyday unless max_profit_by_buyday.empty?
    end
    max_profit = 0
    profits.each do |buyday,sell_info|
      sellday = sell_info.keys[0]
      profit = sell_info[sellday]
      if profit > max_profit
        result = [buyday,sellday]
        max_profit = profit
        p max_profit
      end
    end
  end
  result
end

stock_picker([17,16,15,16,3,6,9,15,16,3,8,6,10,2,1])


