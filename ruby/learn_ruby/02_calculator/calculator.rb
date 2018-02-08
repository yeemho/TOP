def add(num1,num2)
  num1+num2 
end

def subtract(x,y)
  x-y
end

def sum(array)
  sum = 0
  if array.length == 0
    sum = 0
  else
    array.each do |x|
      sum = sum + x
    end
  end
  sum
end

def multiply(array)
  if array.length == 0
    product = "Not valid"
  else
    product = 1
    array.each do |x|
      product = product*x
    end
  end 
  product
end

def power(base,power)
  base**power
end

def factorial(n)
  solution = 1
  while n > 1
    solution = solution*n
    n = n-1
  end
  solution
end
