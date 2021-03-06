/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    
    var ram: Int
    var yearManufactured: Int


init?(ram: Int, yearManufactured: Int) {
    if ram < 0 && (yearManufactured < 1970 || yearManufactured > 2020)
    {
        return nil
    } else {
        self.ram = ram
        self.yearManufactured = yearManufactured
    }
}
    
}

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
