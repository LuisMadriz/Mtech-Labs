/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var someTypes: [Any] = [10.50, 8, "Peter", true, 8.20]
print(someTypes)

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for someType in someTypes {
    
    
    
    if let integer = someType as? Int {
        print(integer)
    }
    if let double = someType as? Double{
        print(double)
    }
    if let boolean = someType as? Bool{
        print(boolean)
    }
    if let string = someType as? String{
        print(string)
    }
}
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 var total2: Double = 0

for someType in someTypes {
    
    
    
    if let integer = someType as? Int {
        total2 = total2 + Double(integer)
    }
    if let double = someType as? Double{
        total2 += double
    }
    if let boolean = someType as? Bool{
        print(boolean)
    }
    if let string = someType as? String{
        print(string)
    }
}

print(total2)
