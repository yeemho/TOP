function translate(string) {
	const words = string.split(' ');
	var index;
	const coded = words.map(word => {
	  
	  const vowels = word.match(/[aeiou]/g);
	  if( vowels[0]=='u' && word[word.indexOf(vowels[0])-1]=='q') {
	    index = word.indexOf(vowels[0])+1;
	  } else { 
	    index = word.indexOf(vowels[0]); 
	    }
	 
	  return word.slice(index) + word.substr(0,index) + "ay";
	  
  })
  
	return coded.join(' ');
	
	}
	


module.exports = {
	translate }
