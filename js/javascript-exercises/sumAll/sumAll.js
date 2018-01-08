var sumAll = function() {
  var args = Array.from(arguments).sort();
  var sum=0;
  
  if( typeof args[0] == 'number' && typeof args[1] == 'number' ) {
    if (args[0]<0 || args[1]<0 ) {
      return 'ERROR';
    } else {
      for (var i=args[0]; i<=args[1]; i++) {
        sum += i;
      }
      return sum;
    }
  } else {return 'ERROR';}
  
  
}

module.exports = sumAll
