var reverseString = function(string) {
  var output='';
  var array = string.split('');
  for (i=array.length-1;i>=0; i--) {
    output += array[i];
  }
  return output;
}

module.exports = reverseString
