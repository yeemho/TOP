var fibonacci = function(member) {
 
  if (member>=0) {
    var fibonacci = [1,1];
 
    for (var i=1; i<member; i++) {
      var nextNum = fibonacci[i]+fibonacci[i-1];
      fibonacci.push(nextNum);
     }
    return fibonacci[member-1];
  } else { return 'OOPS'}
  
 }

module.exports = fibonacci
