var repeatString = function(string, number) {
  output = '';
  if(number<0) {
    return 'ERROR';
  } else {
    for(i=0; i<number; i++) {
      output += string;
    }
  }
  return output;
}

module.exports = repeatString
