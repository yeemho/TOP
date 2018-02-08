class Timer
  
  attr_accessor :seconds
  
  def initialize
    @seconds = 0
  end
  
  def seconds
    @seconds
  end
  
  def time_string
    sec = @seconds % 60  
    minutes = (@seconds/60)%60
    hours = (@seconds/60)/60
    
    sec.to_s.length < 2 ? sec = "0#{sec}" : sec = "#{sec}"
    minutes.to_s.length < 2 ? minutes = "0#{minutes}" : minutes = "#{minutes}"
    hours.to_s.length < 2 ? hours = "0#{hours}" : hours = "#{hours}"
    
    string = "#{hours}:#{minutes}:#{sec}"
    
  end
  
end
