var palindromes = function(phrase) {
  const string = phrase.toLowerCase().replace(/\s|[^a-z]/g,'');
  const reversed = string.split('').reverse().join('');
  return reversed == string;
}

module.exports = palindromes
