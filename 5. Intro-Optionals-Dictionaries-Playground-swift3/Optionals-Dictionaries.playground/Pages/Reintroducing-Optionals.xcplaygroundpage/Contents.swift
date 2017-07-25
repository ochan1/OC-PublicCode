/*:
 ![Make School Banner](./swift_banner.png)
 # Optionals in Swift
 
 ## Another Introduction to Optionals
 
 We've talked a bit about _optionals_ before, but let's recap and discuss some best practices!
 
 ### Why Optionals?
 
 Sometimes, it's useful to express the fact that a variable may contain a value or no value at all. Swift allows us to do this with **optionals**. Optionals contain **either** a value **or** nothingness -- we call this `nil`. Optionals are like a box. There might be something inside or it might be empty but you can't know until you open it!
 
 We can declare any variable (not constants) as an optional by putting a question mark (`?`) at the end of the type's name. For example, we can declare a variable of type `Int?` (read as "optional `Int`"):
 */
var maybeAnInt: Int? = 15
//: Here, we have expressly given the variable a value of 15, but we could just as easily have assigned it `nil`:
maybeAnInt = nil
/*: 
 Now `maybeAnInt` is `nil`, which is to say it has _no value_. If `maybeAnInt` had declared as a regular `Int`, we could not have set it to `nil`.
 
 ## Why would I ever want an empty variable?
 
 Remember _Game of Life_ and the _Grid Simulations_ tutorials? We created a two dimensional `Array` of `Character?` to represent the grid. Sometimes a cell had a value, sometimes it did not. When it did not, we used `nil`.
 
 If you think back, you'll remember that you only ever set the value the `Character?` and checked if they had a value in those tutorials. Let's discuss how you can actually work with optionals!

 ## Unwrapping an Optional
 
 When we retrieve the value from an optional, must "unwrap it". This is like opening the box and seeing whether or not there's anything inside. You might remember this from earlier, but we can test whether an optional has a value by comparing it to `nil` in a conditional. If it is not equal to `nil`, it contains a value. Woo hoo!
 
 We can then safely use **force unwrapping** to get its value. Force unwrapping is done by putting an exclamation point (`!`) after the name of the variable we want to unwrap. This tells Swift that the optional contains a value and we want to read it.
 
 - important: If we're wrong, the code will crash. Here, we test whether `maybeAnInt` has a value and if it does, we rip open the box (force unwrap it) and print its value. Make sure to _ALWAYS_ check for `nil` before force unrwrapping an optional. Code that crashes is bad code!
 
 */
if maybeAnInt != nil {
    print("maybeAnInt contains a value, and it is \(maybeAnInt!).")         // There's a check for nil here. If it's not nil, it will "force unwrap" value.
} else {
    print("maybeAnInt does not contain a value.")
}
// maybeAnInt!
/*:
 
 - experiment:
 Go back to line 17 and try changing the value of `maybeAnInt` from `nil` to something else. Notice the message is printed depending on the value.
 
 ## A short challenge
 
 - callout(Challenge): Define an array of optional `Double` below that contains:
 
        [154.4, nil, 133, 13.4, 221.3, nil, nil, 103.2]
 
 */
var nilList: [Double?] = [154.4, nil, 133, 13.4, 221.3, nil, nil, 103.2]


/*:
 
 - callout(Challenge): Write code to iterate through the array and count the number of `nil` values while also summing all the non-nil values. Make sure to force unwrap each element safely!
 
    Print the the values you just computed to the console as:

        "There were \(numberOfNils) nil values and the sum is \(sum)"
 
    You should see this in the console if you did everything correctly:
 
        There were 3 nil values and the sum is 625.3.
 
 */
var numberOfNils: Int = 0
var sum: Double = 0
for amtOfNils in nilList {
    if amtOfNils != nil {
        sum += amtOfNils!          // Now that nil is tested, and we know that "amtOfNils" position in "nilList" does not equal to "nil", it will add that value to "sum"
    } else {
        numberOfNils += 1
    }
}

print("There were \(numberOfNils) nil values and the sum is \(sum)")
/*:
 [Next](@next)
 */
