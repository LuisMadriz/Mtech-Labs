/*:
## Exercise - Structs, Instances, and Default Values
 
 Imagine you are creating an app that will monitor location. Create a `GPS` struct with two variable properties, `latitude` and `longitude`, both with default values of 0.0.
 */
struct GPS {
    var lattitude: Double = 0.0
    var longitude: Double = 0.0
}

//:  Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
var somePlaced = GPS(lattitude: 0.0, longitude: 0.0)

//:  Change `somePlace`'s latitude to 51.514004, and the longitude to 0.125226, then print the updated values.
somePlaced = GPS(lattitude: 51.514004, longitude: 0.125226)
print(somePlaced)
//:  Now imagine you are making a social app for sharing your favorite books. Create a `Book` struct with four variable properties: `title`, `author`, `pages`, and `price`. The default values for both `title` and `author` should be an empty string. `pages` should default to 0, and `price` should default to 0.0.
struct Book {
    var title: String = ("")
    var author: String = ("")
    var pages: Int = (0)
    var price: Double = (0.0)
}

//:  Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then, using the properties of `favoriteBook`, print out facts about the book.
var favoriteBook = Book(title: "Marketing 2.0", author: "Philip Kotler", pages: 350, price: 45.50)
print("Title: \(favoriteBook.title), Author: \(favoriteBook.author), Number of Pages: \(favoriteBook.pages), Price: \(favoriteBook.price)")
/*:
page 1 of 10  |  [Next: App Exercise - Workout Tracking](@next)
 */
