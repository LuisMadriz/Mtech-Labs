/*:
## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking on the variable name.
 */
var firstDecimal: Double = 10.35
var secondDecimal: Double = 20.70

var trueOfFalse: Bool = false
print("The code was not able to be compiled because the type of the variables were different.")

//:  Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var example = "This is an example"

print("The line of code can not be compiled because the variable have different types, one is double and the other one is a string")
//:  Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
var cars: Int = 100

print("The code was not able to be compiled because the variable car is an Integer and the variable firstDecimal is a Double.")
/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
 */
