/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMySelf(name: String) {
    print("Hello my name is \(name)")
}

//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
let randomNum = Int.random(in: 0...4)
func magicEightBall(random: Int) {
    switch randomNum {
    case 0:
        print("You get a 0")
    case 1:
        print("You get a 1")
    case 2:
        print("You get a 2")
    case 3:
        print("You get a 3")
   default:
        print("You got a highest number")
   }
}
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
