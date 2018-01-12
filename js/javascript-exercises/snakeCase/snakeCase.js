var snakeCase = function(string) {
  
  string = string.replace(/[^a-zA-Z]+/g ,' ');
  
  if(string.indexOf(' ')<0) {
    string = string.replace( /([A-Z])/g , " $1");
  }
  
  return string
    .trim()
    .toLowerCase()
    .replace(/-/g,' ')
    .replace(/\s/g,'_')
  
}

module.exports = snakeCase
