module Enumerable

  def my_each
    return enum_for(__method__) { size } unless block_given? #return and exit rest of code
    case self.class.to_s
    when 'Array','Range'
      for i in 0...self.to_a.length do
        val = self.to_a[i]
        yield(val)
      end  
    end
    p self
  end
  
  def my_each_with_index
    return enum_for(__method__) { size } unless block_given?
    case self.class.to_s
    when 'Array','Range'
      for i in 0...self.to_a.length do
        val = self.to_a[i]
        yield(val,i)
      end
    end
    p self
  end
  
  def my_select
    return enum_for(__method__) { size } unless block_given?
    result = []
    for i in 0...self.length do
      val = self[i]
      result.push(val) if yield(val)
    end
    result
  end
  
  def my_all?
    return enum_for(__method__) { size } unless block_given?
    result = true
    self.my_each do |val|
      if !yield(val)
        result = false
        break
      end
    end
     result
  end
  
  def my_any?(*arg)  
    unless block_given?
      unless arg.length == 1
        my_each {|val| return true unless val == false || val.nil? }
        return false
      end
      my_each {|val| return true if (arg[0] === val) == true}
      return false
    end
    my_each {|val| return true if yield(val)}
    false   
  end
  
   
  def my_none?(*arg)
    unless block_given?
      my_each {|val| return false if val } unless arg.length == 1 
      my_each {|val| return false if arg[0]===val }
      return true
    end
    my_each {|val| return false if yield(val)}
    true
  end
  
  def my_count(*arg)
    count = 0
    unless block_given?
      return self.length unless arg.length = 1
      my_each {|val| count+=1 if val == count }
      return count
    end
    my_each {|val| count+=1 if yield(val)}
    count
  end
  
  def my_map(&proc)
    return enum_for(__method__) { size } unless block_given? || proc
    result = []
    code = case proc
    when nil
      code = block
    else
      code = proc
    end
    my_each {|val| result.push(code.call(val)) }
    result
  end
  
  def my_inject(accumulator, method=nil, &block)
    raise ArgumentError, "Must provide either method or block not both" if method && block
    accumulator = accumulator.nil? ? self[0] : accumulator
    
    block = case method
      when nil then block
      when Symbol then lambda {|acc,value| acc.send(method,value) }
      else
        raise ArgumentError, "method must be a Symbol"
    end  
    my_each do |val|
      accumulator = block.call(accumulator,val)
    end
    accumulator
  end
  
end

#define outside the module so enum methods can be
 def multiply(array)
    array.my_inject(1,:*)
 end


p [2,4,5].my_map {|a| puts a}


