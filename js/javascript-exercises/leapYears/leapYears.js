var leapYears = function(year) {
  if(year > 0 && year % 100 == 0) {
    if(year % 400 == 0) {
      return true;
    } else {return false;}
  } else if ( year % 4 == 0 ) { 
    return true; 
  } else { return false; }
}

module.exports = leapYears
