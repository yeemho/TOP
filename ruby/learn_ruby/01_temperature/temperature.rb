def ftoc(tempInF)
  tempInC = (tempInF.to_f - 32)*5/9
end

def ctof(tempInC)
  tempInF = (tempInC.to_f*9/5) + 32
end
