/*:
## App Exercise - Finding Movements

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.


 You decide you want your app's users to be able to put in a heart rate range they would like to hit, and then you want the app to suggest movements where historically the user has reached that heart rate range. The dictionary `movementHeartRates` below contains keys corresponding to the movements that the app has tracked, and values corresponding to the average heart rate of the user that your fitness tracker has monitored historically during the given movement.

 Loop through `movementHeartRates` below and if the heart rate doesn't fall between `lowHR` and `highHR`, continue to the next movement and heart rate. Otherwise, print "You could go <INSERT MOVEMENT HERE>".
 */
let lowHR = 110
let highHR = 125
var movementHeartRates: [String: Int] = ["Walking": 85, "Running": 120, "Swimming": 130, "Cycling": 128, "Skiing": 114, "Climbing": 129]

for (movement, average) in movementHeartRates {
    if (average) <= lowHR {
        continue
    }else {
        print("You could go \(movement)")
    }
   
}
