  //define functions to operate on two numbers
  let add = (a,b) => a+b;
  let subtract = (a,b) => a-b;
  let multiply = (a,b) => a*b;
  let divide = (a,b) => a/b;
  
  //function takes operator parameter as string, two number parameters
  function operate (operator, num1, num2) {
    var code = operator.charCodeAt(0); 
    var total;  
    switch (code) { //calls functions on number parameters and saves results into a variable
      case 43:
        total = add(num1,num2);
        break;
      case 45:
        total = subtract(num1,num2);
        break;
      case 42:
        total = multiply(num1,num2);
        break;
      case 47:
        total = divide(num1,num2);
        break;
    }
    return total; // return value is variable containing solution
  }
  
  function calculate() {    
    //getCalcParameters()
    var operator = displayValue.match(/[-*+/]/g); //put minus first otherwise it is read as a hypen
    var numbers = displayValue.match(/\d+\.*\d*/g);  
   
    //Multiply and divide take operation precedence  
    while(operator.indexOf('*')!= -1 || operator.indexOf('/') !=-1) {
      for(var i=0; i<operator.length; i++) {
        if(operator[i] == '/' || operator[i] == '*') {
          var num1 = numbers[i];
          var num2 = numbers[i+1];
          var subtotal = operate(operator[i],num1,num2);
          operator.splice(i,1);
          numbers.splice(i,2,subtotal);
        }   
      }
    }  
    //Add and subtract  
    while(operator.indexOf('+')!= -1 || operator.indexOf('-') !=-1) {
      for(var i=0; i<operator.length; i++) {
        if(operator[i] == '+' || operator[i] == '-') {
          var num1 = Number(numbers[i]);
          var num2 = Number(numbers[i+1]);
          var subtotal = operate(operator[i],num1,num2);
          operator.splice(i,1);
          numbers.splice(i,2,subtotal);
        }   
      }
    }     
    return numbers[0];
  }
  
  
  var displayValue='';
  var isInitialInput = true;
  var prevIsNumber = false;
  var prevIsEqual = false;
  var decimalUsed = false;
  var inProgress = false;
  
  //takes input parameter as a string and updates display
  function updateDisplay(input) {
    const display = document.querySelector('#display');
    const pressedBtn = Number(input);
   
    switch (isInitialInput) {
      case true:
        if(input == '.' & decimalUsed == false) {
          displayValue = `0${input}`;
          isInitialInput = false;
          prevIsNumber = false;
          decimalUsed = true;
        } else if (Number.isInteger(pressedBtn)) {
          displayValue = input;
          isInitialInput = false;
          prevIsNumber = true;
        }
        break;
      case false:
        if(Number.isInteger(pressedBtn)) {//if prev is equal?
          displayValue += input;
          prevIsNumber = true;
        } else if (prevIsNumber) {
           if(input == '.') {
              if(decimalUsed == false) { 
                displayValue += input;
                decimalUsed = true;
              }
           } else {
              displayValue += input;
              prevIsNumber = false;
              decimalUsed = false;
            }       
        }
        break;
    }
    display.textContent = displayValue;
  }
  
  
  function clearDisplay() { 
    document.querySelector('#display').textContent = 0;
    document.querySelector('#result').textContent ='';
    displayValue='';
    isInitialInput = true;
    prevIsNumber = false;
  }
  
  function backSpace() {
    const display = document.querySelector('#display');
    if (displayValue.length <= 1) {
      displayValue = 0;
    } else {
      displayValue = displayValue.slice(0,-1);
    }
    display.textContent = displayValue;
  }
   
   
  //Event Listeners
   const btns = document.querySelectorAll('.math');
  btns.forEach(btn=> btn.addEventListener('click', function(e) {
    updateDisplay(btn.value); 
    console.log(btn.value);
  }));
  
   const btnEqual = document.querySelector('button[name=equal]');
   btnEqual.addEventListener('click', function() {
    if(prevIsNumber) {
      console.log(calculate());
      var solution = calculate();
      document.querySelector('#result').textContent = solution;
    } else { alert('Invalid Entry')}
   })
 

