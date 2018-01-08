var removeFromArray = function(array) {
  var index = '';
  var args = Array.prototype.slice.call(arguments,1); //put values to remove into an array
  args.forEach(function(element) {
    index = array.indexOf(element);
    if(index>=0) {
      array.splice(index,1);
    }
  })
  return array;
}

module.exports = removeFromArray
