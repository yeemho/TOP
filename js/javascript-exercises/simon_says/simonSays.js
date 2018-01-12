function echo() {
	const output = arguments[0];
	return output;
}

function shout() {
	const words = arguments[0].toUpperCase();
	return words;
}

function repeat() {
  const word = arguments[0];
  const times = arguments[1];
  var output = `${word} ${word}`;
  for (i=2; i<times; i++) {
    output +=` ${word}`;
  }
  return output;
}

function pieceOfWord() {
	const string = arguments[0];
	const length = arguments[1];
	return string.slice(0,length);
}

function firstWord() {
	const string = arguments[0];
	const index = string.indexOf(' ');
	return string.slice(0,index);
}

function capitalize(word) {
	return word.charAt(0).toUpperCase() + word.slice(1);
	// This function just capitalizes the word given to it, use in conjunction with titleCreator
}

function titleCreator() {
  const strings = arguments[0].split(' ');
	const capitalised = strings.map (word => {
	  if (word.length > 4) { 
	    return capitalize(word) 
	  } else if (strings.indexOf(word) === strings.length -1) { 
	    return capitalize(word) 
	  } else { return word } 
	  
	})
	return capitalize(capitalised.join(' '));
}

module.exports = {
	echo,
	shout,
	repeat,
	pieceOfWord,
	firstWord,
	titleCreator
}
