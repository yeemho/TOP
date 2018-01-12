var caesar = function(string,shiftFactor){
  const letters = string.split('');
  shiftFactor = shiftFactor % 26;
  
  const isAlphaNumeric = char => {
    return char.match(/^[a-z0-9]+$/i) !== null
  }
  
  const shifted = letters.map(letter => {
    if(isAlphaNumeric(letter)) {
      const charCode = letter.charCodeAt(0);
      var shiftCode = charCode + shiftFactor;
      if (charCode >= 65 && charCode <= 90) {
        shiftCode = shiftCode < 65 ? shiftCode + 26 : shiftCode;  
        shiftCode = shiftCode > 90 ? shiftCode - 26 : shiftCode;
      } else if (charCode >= 97 && charCode <= 122) {
        shiftCode = shiftCode < 97 ? shiftCode + 26 : shiftCode;  
        shiftCode = shiftCode > 122 ? shiftCode - 26 : shiftCode;
      }
      return String.fromCharCode(shiftCode);
    } else { return letter; }
 
  })
  
  return shifted.join('');
  
  
}

module.exports = caesar
