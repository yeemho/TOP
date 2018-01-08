var ftoc = function(tempInF) {
  var tempInC = (tempInF - 32) * 5/9;
  return Math.round(tempInC*10)/10;
}

var ctof = function(tempInC) {
  var tempInF = (tempInC * 9/5) +32;
  return Math.round(tempInF*10)/10;
}

module.exports = {
  ftoc,
  ctof
}
