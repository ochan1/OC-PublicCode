/*:
 ![Make School Banner](./swift_banner.png)
 
 # Optional Binding
 
 A more "Swift-y" way of testing and using an optional value is called **optional binding**. To do this we test for the presence of a value and, if it exists, we create a new variable for this value in a narrower scope. Here, we "bind" the value of `optionalInt` (if present) to a newly scoped constant named `optionalInt`, which only exists inside the `if/else` block, and print it...
 
 */
var optionalInt: Int? = 15
if let optionalInt = optionalInt {
    print("optionalInt contains a value, and it is \(optionalInt)")
} else {
    print("optionalInt does not contain a value")
}
print("Outside of the 'if let', optionalInt contains \(optionalInt)")
/*:
 
 The first time you see this, it's a bit confusing. Worry not though, you'll get used to the syntax soon enough. Notice how this printed to the console:
 
     optionalInt contains a value, and it is 15
     Outside of the 'if let', optionalInt contains Optional(15)
 
 Think about that output for a moment.
 
 - callout(Challange): Why did the second print statement print the value as `Optional(15)` and not `15` like the first?
 
 - callout(Answer): The "bound and unwrapped" value only exists inside of the if-let-statement. It does not exist in the else-statement or outside the if-let. When we leave the if-let, `optionalInt` goes back to being a regular optional.
 
 - experiment:
 Try changing the value of `optionalInt` again, and again take note that if it contains a value, the message indicates this and the local variable `optionalInt` has the same value. If it doesn't contain a value, then if-let-statement fails, it will go to the else-statement, and an unwrapped `optionalInt` won't be created.
 
 ## This does the same thing as the last page
 
 Yes it does! Like we said, this is just a more "Swift-y" way of doing the same thing. If you stick to this if-let syntax, your code will be safer. 
 
 ### Why does this make your code safer?
 
 If you use the `!= nil` syntax when you need to work with the actual value, then you have to use "force unwrapping" with the `!` we saw on the last page. Remember what we said about "force unwrapping"? If the value does not exist, then your code will crash! By sticking to if-let you never have to "force unwrap" and you will not accidentally forget to check for `nil`.
 
 ## A repeat challenge
 
 - callout(Challenge): Define an array of optional `Int` below that contains:
 
         [555, nil, 331, 135, 2213, nil, nil, 232, nil, nil]
 
     Write code to iterate through the array and count the number of `nil` values while also summing all the non-nil values. This time, make sure to use "optional binding". You should not need any `nil` checks for this solution!
     
     Print the the values you just computed to the console as:
     
         "There were \(numberOfNils) nil values and the sum is \(sum)"
     
     You should see this in the console if you did everything correctly:
     
         There were 5 nil values and the sum is 3466.
 
 */

var mitInt: [Int?] = [555, nil, 331, 135, 2213, nil, nil, 232, nil, nil]
var numberOfNils = 0
var sum = 0

for amtOfNils in mitInt {
    if amtOfNils != nil {
        sum += amtOfNils!
    } else {
        numberOfNils += 1
    }
}

print("There were \(numberOfNils) nil values and the sum is \(sum)")
/*:
 [Previous](@prev) | [Next](@next)
 */
