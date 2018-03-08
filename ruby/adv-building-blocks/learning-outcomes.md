### Conditionals and Flow Control:

1. What is a “boolean”?
   * A data type that can have a value of either true or false
2. What are “truthy” values?
   * truthy values include all values expect nil and false in Ruby
3. Are nil, 0, "0", "", 1, [], {} and -1 considered true or false?
   * nil is considered false
   * all others considered true
4. When do you use elsif?
   * when you want to add alternative tests to your if/else statement
5. When do you use unless?
   * When you want the code to run in all cases apart from the exception
6.  What does <=> do?
   * This is called the Combined Comparison Operator used to compare two objects. It returns:
      - 0 if first equals the second object
      - 1 if first is greater than second object
      - -1 if the first is less than the second object
7. Why might you define your own <=> method?
   * You can use it to specify an alternative to the default sort algorithm
8.  What do || and && and ! do?
   * These are boolean operators used to test conditions and return boolean values
      - `||` checks if either conditions are true
      - `&&` checks if both conditions are true
      - `!` reverses true and false values
9. What is returned by puts("woah") || true?
   * returns true since there is a true value
10. What is ||=?
   * `||=` is used for conditional assignment, so it will only assign a value if there isn't an existing value
11. What is the ternary operator?
   * Usually of the form `condition ? value if true : value if false` it is shorthand for an if/else statement
12. When should you use a case statement?
   * When you want a concise way to check many if/else conditions

### Iteration:

1. What does loop do?
   * Loops allow you to repeatedly perform code depending on some condition.
2. What are the two ways to denote a block of code?
   * In Ruby, you can write code within `{ }` or `do...end` to denote a block of code
3. What is an index variable?
   * In the context of an array, the index variable represents the position of each element in the ordered list. The indicies go start at 0 and go up to value of length of array -1.

4. How do you print out each item of a simple array [1,3,5,7] with:

   * loop?
         i = 0
         loop {
            puts array[i]
            i += 1
            break if i = array.length
         }

   * while?
         i = 0
         while i < array.length {
            puts array[i]
            i += 1
         }

   * for?

         for i in 0..(array.length -1) {
            puts array[i]
         }

   * #each?

         array.each { |X| puts x }

   * #times?

         array.length.times { |i| puts array[i] }

5. What’s the difference between while and until?
   * while starts off with a true condition and loops until it turns false
   * until starts off with a false condition and loops until it returns true
6. How do you stop a loop?
   * You can call `break` to exit a loop, and can also call `break if condition`
7. How do you skip to the next iteration of a loop?
   * calling `continue` will skip all subsequent code in the current iteration and move onto the next iteration
8. How would you start the loop over again?
   * `redo` will restart the loop without evaluating the condition in the first round
   * `retry` is similar except it evaluates the condition. Also n/a in while and until loops
9. What are the (basic) differences between situations when you would use while vs #times vs #each?
   * Use while if you don't know how many times to repeat the code
   * Use times when you know exactly how many times to repeat the action
   * each when you want to loop through an array and perform the action once on each element
10. What does nesting loops mean and when would you use it?
   * This is when you call a loop inside of another loops, so that the entire inner loop is executed for each iteration of the outer loops
   * Usually used for multi-dimensional operations such as searching an array within an array

Blocks, Procs, and Lambdas:

1. How is a block like a function?
   * A block is a bit of executable code, can be thought of as anonymous functions
2. How is a block different from a function?
   * Functions can be invoked repeatedly by calling their name and passing in the appropriate information whereas a block will only execute once.
3. What are the two ways to declare a block?
   * You can declare a block with code between `{...}` or `do...end`
4. How do you return data from a block?
   * You have to use implicit return (returns whatever is on the last line)
   * Do not use `return` keyword since this will return from the method that called the block
5.    What happens if you include a return statement in a block? As above
6.    Why would you use a block instead of just creating a method?
   * Allows you to write generic instructions that can be used by other Methods
   * Provides an option that can override how some methods work
7.    What does yield do?
   * When used inside a method, it transfers control at the point it is called to the code block that was passed in as a parameter
8.    How do you pass arguments to a block from within a method?
   * You can pipe it into the yield statement as a parameter
9.    How do you check whether a block was actually passed in?
   * you can use `#block_given?` for example, `yield if block_given?`
10.    What is a proc?
   * A proc is a block that can be saved to a variable
11.    What’s the difference between a proc and a block?
   * A proc can be saved to a variable and called repeatedly/passed into methods whereas blocks are temporary chunks of code
12.    When would you use a proc instead of a block?
   * When you want to call on the code repeatedly. In context of functions, if you want to pass in more than one block of code, you would save them into Procs. If your function normally expects a block, you can pass in a Proc by prepending it with `&`
13.    What is a closure?
   * An umbrella term for ways to hold and pass around chunks of code. Blocks, Procs, Lambdas and Methods are all closures
14.    What is a lambda?
   * A lambda is a special type of closure. It is a full method that has not been named.
15.    What’s different between a lambda and a proc?
   * It allows more flexibility for returning data since it allows safe use of the `return` statement without returning from the enclosing method. It is also stricter than a Proc as it checks the correct number of arguments are passed
16. What is a Method (capital “M”)?
   * Methods are a class of their own. They are a way to pass a normal method to another normal method by wrapping the symbol of its name in the word `method()`
17. What do Methods basically allow you to do that could probably be pretty interesting when you’re writing some more advanced programs later on?
   * A Method is a way of taking named methods and passing them as arguments to or returns from methods.

Enumerable and Modules:

1.  What is a module?
   * A collection of methods that are packaged together and can be used/mixed in with other classes
2.  Why are modules useful?
   * It allows developers to write a method once and be able to access it in other classes that they are writing
3.  What does #each do?
   * #each is an iterator method that goes through each item in the object it was called on and passes it to the code block.
4.    What does #each return?
   * The code block can do something with the item and output something(as a side effect). Each itself will return the ORIGINAL object that it was called on
5.  What does #map do?
   * #map will transform each item in your object in some way as determined by the code block. So it will take each object, pass it into the code block, run it.
6.    What does #map return?
    * #map returns an object that contains what your code block returned each time.
7.    What is the difference between #map and #collect?
    * They are the same
8.    What does #select do?
   * Select filters elements in an object by running the code block on each item and selecting the ones that meet the criteria
9.    What does #select return?
   * A new object containing the items for which the code block returned true
    What is the difference between #each #map and #select?
10.  What does #inject do?
   * Similar to #reduce it allows us to keep track of the result as we iterate. It will pass the element and whatever was returned in the previous iteration into the code block. You can specify an initial value or have it default to the first item of the object
11.    When might you use #inject?
   * Say when you want to sum all element in an array.
12.    How do you check if every item in a hash fulfills a certain criteria?
   * Using `my_hash.any? { |key, value| key or value criteria }`. #any? will return true if any of the times the block runs return true
13.    What about if none of the elements fulfill that criteria?
   * The above method will return false if each time the block ran it returned false
14.    What (basically) is an enumerator?
   * It is a module that is essentially a collection of methods that can be inserted and used in other classes. So many of the methods discussed can be applied to Array, Hash and Range classes.

Writing Methods:

1.    How many things should a method ideally do?
   *  One thing and they should be short, around 10 lines.
2.    What types of things should a method modify?
   * Should only modify the variables that have been passed in. Should not modify global variables, the caller object or destructively modify the arguments.
3.    What should you name a method?
   * Describe what it will return or intended side effect in a short but descriptive way. End with a question mark if it returns a boolean.
4.    What does self mean?
   * Refers to the caller object
5.    What do you need to do to create your own Ruby script file?
   * Create a file with extension `.rb`
6.    How would you run a Ruby script from the command line?
   * `$ ruby filename.rb`
7.    How can you check whether your script was being run from the command line?
   * You can check whether command line constant `$0`(original file that was run in CL) is the same as `__FILE__` (name of current file). `$0` could be different from your script if the script was required by another file that was run in the CL.
8.    What is a shebang line?
* If you want to run the script without having to type `ruby` in front of the filename, you can use the `chmod` command. The shebang line lives as the top line in your file of interest and basicall tells the `chmod` command that you want to use the ruby interpreter. e.g. `#!/usr/bin/ruby`
9.    What does require do?
   * If you want to bring in any gemfiles or scripts into IRB you can use `require './your_script.rb'`
10.    What does load do?
   * Another way to include your script file in IRB
11.    What is the difference between require and load?
   * Require only loads the file once into IRB so load is used in cases where you've made changes to the file and want to reload it into IRB
12.    How do you access any parameters that were passed to your script file from the command line?
   * You can access it through a command line constant named ARGV which is an array containing all passed in parameters.
13.    What does #send do?
   * When called on an object, lets you run a method that is passed in as a parameter. `Klass.new.send :hello, "gentle readers"` will run the hello method with an argument of 'gentle readers' in the Klass class.
14.    When would #send be used that’s different from just running the method on an object ‘normally’?
   Ruby lets you define methods in runtime and #send lets you call methods dynamically.
