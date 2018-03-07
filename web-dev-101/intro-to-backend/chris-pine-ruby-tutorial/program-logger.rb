def log descriptionOfBlock, &block
  puts "Beginning " + descriptionOfBlock
  result = block.call
  puts descriptionOfBlock +" finished, returning: "+ result.to_s
end

little_block = Proc.new do
  5
end

another_block = Proc.new do
  puts "I like Thai food"
end

log "Outer block" do
  log "Some little block" do
    5
  end
  log "Yet another block" do
      "I like Thai food!"  
  end
  false
end
