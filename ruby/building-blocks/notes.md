# Ruby Building Blocks - Notes

### Numbers, Operators and Expressions:

1. What’s the difference between an Integer and a Float?
   * An integer is a whole number without decimal value whereas a float has a decimal value.
2. Why should you be careful when converting back and forth between integers and floats?
   *  If you convert a float to an integer, it loses the decimal value. In the case when you want to convert it back to a float, it will not equal the original value. For example, if you do `var = 5.2.to_i` it yields 5. However, when you convert it back via `var.to_f` the value becomes 5.0. This does not equal the original value.
3. What’s the difference between =, ==, and ===?
   * `=` assigns a value to a variable
   * `==` checks whether two things are equal but does not have to be of the same instance
   * `===` checks whether the thing on the right is a member/type/part of the thing on the left.
   * For example, when used in the context of ranges, `(1..4) === 3` will return true since the range includes 3.
4. How do you do exponents in Ruby?
   * `b**p` is how you raise b to the power of p
5. What is a range? How do you create a range?  What are three ways to create a range?
   * A range is a continuous sequence that it written using shorthand notation. You can create a range by using `Range.new(start,finish)`, `(start..finish)` or `(start...finish)`.
6. What’s the difference between (1..3) and (1...3)?
   * `(1..3)` means all the numbers from 1 to 3, including 3.
   * `(1...3)` means all the numbers from 1 to 3, exclusing 3.

### Strings:

1. What’s the difference between single and double quotes?
   They are typically interchangable except for 2 cases:
   * When you want to show quotes within strings without escaping the quote characters.
   * String interpolation of the form "This is a string that includes a ruby #{variable}" only works within double quotes.
2. What is string interpolation?
   * As above
3. What are escape characters?
   *   Escape characters apply to characters that have a special meaning in the program. The compiler must be told to treat them like regular string characters by preceding it with a backslash.
   * E.g. " \#{ " will escape the pound character from referring to a variable in string interpolation.
4. What are line breaks?
   *   Line break special characters start a new line in your string. Using \n or \r in your string will include a line break in your output.
5. How do you make other things into strings?
   * You can call to to_s method on the item
6. How do you concatenate strings?
   *   Concatenation of strings can be done by using + between strings.
7. How do you access a specific character or substring?
   * You can use notation that is similar to array index notation:
      - `string[ind]` can be used to access a character
      - `string[start..finish]` can be used to refer to a substring
      - negaive indicies will work too
8. How do you split up strings into arrays?
   * You can use the string.split() method. If you pass it a parameter, it will split it on every instance of that character in the string.
9. How are strings and arrays similar?
   *   You can use index notation to access characters/elements in both strings and arrays.
10. How do you get and clean up user input on the command line?
   *   Usually when you prompt the user for input, Ruby will record the carriage return from when the user hits "Enter". To clean this up, you can apply the gets.chomp method onto the input.
11. What does it mean that strings are “mutable” and why care?
   *   Mutable means that once declared, it can still be changed. This is important as it allows us to adjust and manipulate a string, which is the basis of many operations/algorithms.
12.  What is a symbol?
   *   A symbol is an immutable data structure that is in the form :symbol. They are stores in one place in memory and cannot be changed once declared. Note that in the context of a use as a variable or hash key, the vlaue associated with the symbol can change, but the name of the symbol cannot.
13. How is a symbol different from a string?
   *   Mutability and also memory. Each time a string is declared, they have a new place in memory.
14.   What is a Regular Expression (RegEx)?
   *   It is an expression that generalises a pattern into a special syntax. This expression can then be used in functions and such to match certain patterns in strings.
15. How can you center or right-justify a string?
   *   You can use the string.rjust(num,character) method which pushes your string to the right by padding your string with extra spaces (or characters specified) up to the number of times you specify.

### Arrays:

1. What are three ways to create an array?
   *   Declaration: `Array.new()`, `my_array = Array[]`
   *   Literal: `my_array = []`

2. How do you prepopulate the array with default data?
   * You can pass parameters into the `Array.new()` declaration. Otherwise you can add the elements when you create an array using the literal notation.
3. How do you access items in an array?
   *   You can access items in an array by referring to the index position of the item using `array[index]`. Index starts at 0 and goes up to -1.
4.    How can you access a specific group of items in an array?
   *   You can either use the regular index notation with a range like array[1..3] or apply the slice method to the array like array.slice(1..3).
5.    How do you modify the items in an array?
   *   You can replace any single or range of items in an array by specifying the index or range you want and then assigning a new value to it.
   *   e.g. `array = [23,4,5,6]`. `array[1] = 2` #=> [23,2,5,6]. `array[1..3] = 2`  #=> [23,2]
6.    How do you combine arrays?
   *   You can combine arrays using concatenation: combined = array1 + array2.
    How do you find the values in one array that aren’t in another?
   *   You can use array subtraction. Subtract the comparison array away from the one you want to test. Only the numbers that weren't in the comparison array will remain in your array.
7.    How do you find values in both arrays?
   *   You can find the union of the array using `array1 & array2`
8.    What is the difference between push/pop and shift/unshift?
   *   Both these sets of methods modify the original array:
   *   push/pop add or remove one single element from the end of the array. The removed element is captured by pop
   *   shift/unshift removes or adds one single element from the start of the array. The removed element is captured by shift.
9.    What is the shovel operator?
   *   Another way to add elements onto the end of the array. Similar to push. e.g. `array << [1,2,3]`
10.   How is > arr.pop different from > arr[-1]?
   *   Pop removes the last element in the array whereas the latter accesses the last element in the array.
11.    How is pushing or <<ing another array into your array different from just adding them together?
   *   The results are different. Say you add an array to another, it will extract all the elements from the first array and add them as individual elements into the second array.
   * Whereas in a push/shovel operation, if you add an array into an existing array, it will treat the entire array as the next element, so you will be nesting that array into the existing element.
12.    How do you delete items in an array?
   *   You can use `Array.delete_at(index)` method. If you want to delete all the elements you can use `array.clear` or set `array = []`
13.   Why should you be careful deleting items in an array?
   *   When you delete items from an array, it will change the index of items after it in the array, which is especially important to note when it is done inside of a method/function that uses indicies to iterate.
14.    How can you convert arrays to strings?
   *   You can apply the array.join(separator) method and tell it which character you want in between each element in the string.
15.    How can you convert from other data types to arrays?
   *   You can apply the .to_a method on strings, ranges etc
16.    How can you figure out if an array contains a particular value?
   *   You can use the array.include?(value) which returns a boolean.
17.    How do you find the biggest item in an array?
   *   `array.max`
18.    How do you find the smallest item in an array?
   *   `array.min`
19.    How do you remove any duplicates from your array?
   *   `array.uniq`
20.    How do you find out how big an array is?
   *   `array.length`
21.    How do you put an array in order?
   *   `array.sort` will sort in ascending order
22.    What are the naming conventions for arrays?
   *   Follows the variable naming conventions of lower snakecase in plural.
23.    What should you store in arrays?
   *   You can store strings, numbers, arrays but try to store one type of data in the array.

### Hashes:

1.    What is a hash?
   *   A hash is a data structure made up of key-value pairs inside curly braces.
   * However, each key (string or symbol) is mapped to a value with no order.
2.    What are keys and values?
   *   A key is where a value in a hash is mapped to. You can think of it as a reference point. Keys are usually strings or symbols. A value is just a piece of data that can be mapped to a corresponding key reference, and can be of any nature such as strings, numbers, arrays.
3.    How is a hash similar to an Array?
   *   A hash holds data, just like an array.
4.    How is a hash different from an Array?
   *   A hash is unordered, and also values are accessed through keys rather than position indicies.
5.    What are 3 ways to create a hash?
   *   my_hash = Hash.new
   *   my_hash = {}
   *   my_hash = { key1:value1, key2:value2 }
4.    What is the hash rocket?
   *   Hash rocket refers to '=>' which is used to match values to keys when creating a hash.
5.    How do you access data in a hash?
   *   You can refer to the index like so my_hash["index"]
6.    How do you change data in a hash?
   *   You can index into a value and assign a new value like so my_hash["index"] = "new_value"
7.    What types of data are good to store in a hash?
   *   All kinds of data including data of variable sizes. You want to use hashes to keep track of objects with different attributes that are not terribly complex, or to store more nuanced data.
8.    What are options hashes?
   *   Option hashes can be used to pass options or parameters into a method. As they can store data of various types and size, it allows the user to specify any number of parameters for that method.
9.    How do you delete data from a hash?
   *   Setting the value within the hash to nil or calling the delete method and passing in the key to the value.
10.    How do you add hashes together?
   *   You can call merge and pass it a parameter of the second hash. In the case of merge conflicts, the incoming hash will override the calling hash.
11.    How do you list out all the keys or values?
   *   You call the keys or values methods respectively on the hash.
12.    How do you see if the hash contains a key or value?
   *   You can chain the include?(item) method on the my_hash.key or my_hash.values methods respectively and pass it the item you are looking for. This will return a boolean.
13.    What is a set?
   *   A set is a type of hash where all the values are of the Boolean form.

Dates and Times:

1.    How do you get the current date and time?
   * Create a new time object with no parameters `Time.new` or use `Time.now`
2.    How do you find just the Year? Month? Hour? Second? Weekday?
   * You can chain the respective methods onto the `Time.now` method. Say `.year`,`.month`, `.day`, `.wday`, `.hour`, `.sec`.
3.    How do you create a Time specifically for 12/25/2013?
   * You can create a new Time object and pass parameters in. In this case `Time.new(2013,12,25)`
4.    How do you find how many days have passed between two Time’s?
   * You can subtract the latter time from the former time since Time objects are numbers that represent seconds since 1970.
5.    What’s the difference between UTC and GMT and Local times?
   * UTC (Coordinated Universal Time) is the benchmark for computers worldwide for communication. It is the new GMT
   * GMT (Greenwich Mean Time) represents time in Greenwich, England
   * local time is the local time zone
6.    How would you find out the time that was 100 seconds ago? 10 days ago?
   * You could use `Time.now - 100` for 10 seconds ag
   * You could use `time = Time.now`, query the day with `day = time.day`, create a new Time object using the `day -10` variable as a parameter.

### Other Random Stuff:

1.    What is nil?
   * Nil represents nothing. In the context of variables and elements in ruby objects, nil means nothing has been assigned yet/the object doesn't exist.
2.    How do you check if something is nil?
   * `object.nil?` will return a boolean
3.    What’s the difference between nil and blank and empty?
   * nil means something doesn't exist
   * empty means object has nothing in it (treats whitespace as content)
   * blank means object has nothing it it (also ignores whitespaces) but is only available as a method in Rails
4.    Are the following nil or empty? * " ", "", [], [""], {}
   * *is not nil nor empty
   * " " is not nil or empty
   * "" is not nil but is empty
   * [] is not nil but is empty
   * [""] is not nil or empty
   * {} is not nil but is empty
5.    What’s the difference between puts and p and print?
   * `print` and `puts` will both output the `item.to_s` onto the screen but `puts` will add a leading newline character whereas `print` continues on the same line
   * `p` will print `item.inspect` followed by a new line. 
6.    What does inspect do?
   * It is an alternative string method to `.to_s`. When applied to an object, this method returns the object hex code and its instance variables
7.    What do +=, -=, *= and /= do?
   * Performs respective operation on the operand then saves the result back into the operand variable.
8.    What is parallel assignment?
   * When you assign more than one variable at a time. E.g. `a,b = 1,"hi"`.
9.    What’s the easiest way to swap two variables?
   * Given two variables already have values, use `a,b = b,a`
