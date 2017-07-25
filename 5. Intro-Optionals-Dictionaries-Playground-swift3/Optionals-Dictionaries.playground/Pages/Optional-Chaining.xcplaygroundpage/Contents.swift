/*:
 ![Make School Banner](./swift_banner.png)
 # Calling Methods on Optionals
 
 You cannot call methods directly on optional values. You must bind them to a value with if-let or force unwrap the optional when calling the method. Calling a method directly on an optional is a compile-time error so your code won't even finish compiling!
 
 We've created a simple class below to demonstrate this.
 
 */

class Secret {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func shareMessage() {
        print("My secret is: '\(message)'.")
    }
}

var first: Secret? = Secret(message: "It's a good idea to use optional binding with if-lets!")
var second: Secret? = Secret(message: "Remember to check optionals for nil.")
var third: Secret? = Secret(message: "Optional chaining is pretty cool too.")
var fourth: Secret? = Secret(message: "I force unwrap and never check for nil because I'm lazy and don't care about my code crashing!")
fourth = nil // that's bad practice, let's get rid of that secret!

/*:
 
 Since these are all `Secret?` types, we cannot just call `shareMessage()`. We must treat it speacial since it is an optional `Secret`.
 
 */

if let first = first {
    first.shareMessage()
}

/*:
 
 Now, that's a lot of syntax for a simply method call... There must be a better way!
 
 ## Optional chaining
 
 But we're programmers and we like working around the rules. You call methods directly on optionals if you use a technique called **optional chaining**. Chaining allows you to try to call a method on an optional, which calls the method if the optional has a value, and does nothing if it does not. Chaining is performed by placing a question mark between the variable name and the dot, parenthesis, or bracket that follows it:
 */

second?.shareMessage()

/*:
 
 Placing a `?` after the name `second` will cause Swift to check whether the variable is `nil` before attempting to call `shareMessage`. If it is `nil`, nothing will happen. If it has a value, the method will be called!
 
 - experiment: Use optional chaining to call `shareMessage` on `third` and `fourth`. What happens?
 */
third?.shareMessage()
fourth?.shareMessage()

/*:
 
 Now, what if we wanted to access a `Secret?`s `message` property and save it to a variable? Could we use optional chaining for that?
 
 - experiment: Try printing the `message` directly from `second` using optional chaining (do not call `shareMessage`).
 
 */
//second?

/*:
 
 Hm. That printed out an optional! When using optional chaining, properties and methods return optional types because they might not run! 
 
 - callout(Challenge): Use optional binding _with_ optional chaining to bind and print out just the `message` property of `third`.
 
 */
var thirdMsg: Secret? = third
print("Challenge Answer")
thirdMsg?.shareMessage()


/*:
 [Previous](@prev) | [Next](@next)
 */
