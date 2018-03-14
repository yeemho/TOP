
### Classes
1.    What is an implicit return?
  * Implicit return is where Ruby will return the last thing it evaluated without the need to include the `return` keyword
2.    What is a class?
  * A class is like a blueprint for creating objects which will have similar attributes and methods that you define in the class. More broadly it is a way of organising and producing objects in Ruby.
3.  When should you use a class?
  * When you want to give methods to your data or you want multiple instances of the data
4.    How do you create a class in your script file?
            def YourClass
               #your code here
            end
5.    What is an instance of a class?
   * They are an object that is a member of that class - it has been created using the blueprint that was set out in the class.
6.    What is the difference between the CamelCase and snake_case styles of naming?
   * Camel case is used for naming Classes whereas snake case is used for naming Ruby variables.
7.    How do you instantiate a class?
            my_instance = YourClass.new
8.    How do you set the state of your new instance?
   * You set up the state of your new instance by passing in values when instantiating the class. The class' `#initialize` method will contain the `@instance_variables` that will keep track of the values you pass in.
9.    What should be done in the #initialize method?
            class YourClass
               def initialize(param1, param2)
                  @variable1 = param1
                  @variable2 = param2
               end
            end
10.    What is a class method?
   * A class method is a set of built in abilities specific to that class.
11.    How is a class method different from an instance method?
   * Class methods have access to other methods and variables at the class level but not at the instance level whereas instance methods can access other methods/variables at both levels.
12.    How are methods you already know like #count or #sort etc instance methods?
   * They manipulate a data set which is an instance of a parent class rather than the class itself.
13.   What’s the difference between how you declare a class method vs an instance method?
   * Class Method: `def self.class_method` or `def ClassName.class_method`or preceding your regular class definition syntax with `class << self`.
   * Instance method: `def class_method`
14.  What’s the difference between how you call a class method vs an instance method?
    What is an instance variable?
    * Class Method: call it on the class E.g.`Array.new` calls the `::new` class method on `Array` class
    * Instance Method: call it on the instance. E.g. `[1,2,3].sort` calls the instance method sort on that instance of the Array class.
15.  What’s the difference between an instance variable and a ‘regular’ variable?
   * The scope differs. Instance variables can only be accessed within that instance of the class while regular variables are not attached to any specific classes/instances.
16.    What are “getter” and “setter” methods used for? What is the difference between a “getter” and a “setter” method?
   * Both are methods used to access instance variables. The getter is used to get the value of an instance variable while setter is used to set the value of the variable.
17.  How do you make instance variables readable outside your class? Writeable? Both at the same time?
   * You can declare an `attr_accessor` method and pass it the names of the variables that you would like to make readable and writeable.
18.    Can a class call its own class methods?
   * Yes
19.  What’s the difference between when you would use a class variable and when you would use a constant?
   * When you are not expecting a value to change, store it in a constant, otherwise use a class variable.
20.    What’s the difference between a class and a module?
   * A module is a library that stores methods and constants that can be used in other modules, classes etc. However it cannot create instances and subclasses like a class can.
21.    When would you use a class but not a module?
   * Use a class when you need to instantiate something or make it exist over time (track instance variables etc) otherwise use a module just to store methods and constants.
22.    How does inheritance work?
   * Inheritance is when a subclass inherits the methods and variables from its parent class
23.    Why is inheritance really useful?
   * You don't have to rewrite methods and variables in subclasses, these will already be available through inheritance
24.    How do you extend a class? What does that mean?
   * `class SubClass < ParentClass` essentially creates a subclass that inherits all methods and variables from the parent class.
   * When you extend a module, you mix in the methods at a class level, so that the class itself can use the methods rather than just instances of the class
25.    What does #super do? Why use it?
   * When called inside the method of a subclass, allows access to the attributes and methods of the same name in the superclass/parent class.

### Scope:

1.    What is scope?
   * The scope of a variable is the context/level at which it is available to the program.
2.   When can you start using a variable?
   * Once you've defined it, it is available to anythin downstream from it.
3.    When is a new scope defined?
   * A new scope is created whenever you indent code and whenever a new variable is defined.
4.   When are methods in scope?
   * Once it's been defined, class and instance methods can be called by the class or instance respectively.
5.    What is a private method?
   * A private method can only be accessed by other methods within its object (instance of the class). They are unreachable by otherwise.
6.    What is a protected method?
   * These can only be accessed by methods inside other instances of the same class or its descendants.
9.    How are private and protected methods different?
   * As above.
10.   What does “encapsulation” mean?
   * Packing of data and functions into a single component. This means that the internal representation of an object is hidden from the outside and only the object can interact with internal data. Public methods can be defined as a way to access the logic.
