function add () {
	const numbers = Array.from(arguments);
	const total = numbers.reduce((total, number) => {
	  return total + number;
	},0)
	return total;
}

function subtract () {
	const numbers = Array.from(arguments);
	return arguments[0] - arguments[1];
}

function sum () {
  const numbers = Array.from(arguments);
	const total = numbers[0].reduce((total, number) => {
	  return total + number;
	},0)
	return total;
}

function multiply () {
	const numbers = arguments[0];
	const product = numbers.reduce((total,number) => {
	  return total*number
	}, numbers[0]);
	return product/numbers[0];
}

function power() {
	const numbers = Array.from(arguments);
	return Math.pow(arguments[0],arguments[1]);
}

function factorial() {
	const number = Array.from(arguments)[0];
	var total = 1;
	for(var i=1; i<=number; i++) {
	  total = total*i;
	}
	return total;
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}
