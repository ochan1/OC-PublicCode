/*:
 ![Make School Banner](./swift_banner.png)
 # Dictionaries
 
 A `Dictionary` type is actually a lot like real world dictionaries. It is a collection type that can store multiple values, and each value has a unique key associated with it. In a real world dictionary, the key would be the word and the value would be the definition. When you want to know the definition of a word, you use the word itself (key) to look up the definition (value). The `Dictionary` works in the same way!
 
 ## Creating a Dictionary
 
 Let's jump right in and define a new `Dictionary` variable.
 
 */
var cities: [String: String] = ["New York City": "United States of America", "Paris": "France", "London": "England"]
/*:
 
 Interesting, huh? Declaring a `Dictionary` type kind of looks similar to declaring an `Array` but with one small difference... In an `Array`, you only store on type of data so an `Array` of `String`s would be declared with `[String]` type. In a `Dictionary`, you have keys and values so you need two types! The key type comes first, followed by a colon `:`, followed by the value type. Our `cities` `Dictionary` has `String` keys and `String` values.
 
 Each _key-value pair_ (word and definition pair in a real world dictionary) is separated by commas.
 
 - callout(Challenge): If real world dictionary has words as _keys_ and definitions as _values_, what are the _keys_ in the `cities` dictionary and what Swift type are they? What are the _values_ in the `cities` dictionary and what Swift type are they?
 
 - callout(Answer): The keys are cities of type `String` and the values are countries of type `String`!
 
    The type of a dictionary depends on both the type of its key and the type of its value. The syntax to declare a dictionary type is `[<key type>: <value type>]`.

 ## Examine the Dictionary
 
 To retrieve the number of key-value pairs, you can use the `count` property just like with arrays. `isEmpty` works as well and returns a `Bool` just like with arrays.
 
 */
if cities.isEmpty {
    print("Cities is empty!")
} else {
    print("The dictionary contains \(cities.count) items.")
    print("The items are \(cities)")
}
/*:
 
 ## Adding items to a dictionary
 
 You can add a new item to a dictionary like this...
 
 */
cities["San Francisco"] = "USA"
print("The dictionary now contains \(cities)")
/*:
 
 It's just like updating the value in an array, except instead of putting the index number inside the brackets, you put the key.
 
 ## Updating a value
 
 Hm. We put New York City's country as `"United States of America"` but San Francisco's country as `"USA"`. That's a bit inconsistent! Let's fix that.
 
 You can also the change a key's value in the same way you set it...
 
 */
cities["San Francisco"] = "United States of America"
print("The dictionary is now more consistent and contains \(cities)")
/*:
 
 ## Getting a value from a dictionary
 
 - callout(Challenge): What type will the dictionary return when we give it a key and ask for a value?
 
 - callout(Answer): A `String`, but not just any `String`, an `String?` (optional `String`). Why does this happen? Well, we cannot guarantee the key is actually in the dictionary. This means that we cannot guarantee we'll actually get a value back. If the key-value pair exists, we'll get an `String?` containing the value. If it doesn't, we'll get an `String?` containing `nil`!
 
 When trying to retrieve a value for a key, there is a possibility that key-value pair does not exist... If it doesn't, the dictionary will return `nil`!
 
 We can retrieve the value for a key by passing in the key just like we do when we access elements of an array.
 
 */
var countryForLondon = cities["London"]
var countryForSydney = cities["Sydney"]
print("London is in \(countryForLondon) and Sydney is in \(countryForSydney)")
/*:
 
 Since dictionaries are optionals, it's best to use optional binding when accessing key-value pairs!
 
 */
if let country = cities["Sydney"] {
    print("Sydney is in \(country).")
} else {
    print("The dictionary does not contain Sydney!")
}
/*:
 
 ## Other useful things to know
 
 You can remove a key-value pair simply by setting the key's value to nil...
 
 */
cities["San Francisco"] = nil
print("San Francisco has been removed and the dictionary now contains \(cities)")
/*:
 
 To define a new empty dictionary you can choose between two different ways...
 
 */
var exampleDictionary = [String: Int]()
//: or
var anotherDictionary: [String: Double] = [:]
/*:
 
 Notice how the type of the values is `Int` in one `exampleDictionary` and `Double` in `anotherDictionary`. The value type can be any type you want. The key can also be any type you want. However, the key has to be _hashable_ . This has to do with how the dictionary actually works beneath the hood, but that's out of the scope of this tutorial. All the Swift basic types work as a key, and there are rarely any situations that you will need a custom type to be the key.
 
 - important: Unlike arrays, dictionaries are _unordered_, which means they do not keep the values in any particular order. Dictionaries are helpful in situations where you want to quickly look up a value based on its unique key.
 
 You can iterate over all the keys in a dictionary with...
 
 */

for key in cities.keys {
    print("\(key) is in \(cities[key]!).")
}

/*:
 
 To empty the dictionary, you set it to `[:]`...
 
 */
cities = [:]
//: - note: `[:]` is the literal for empty dictionary, it can't be `[]` because that means empty array
/*:
 
 Now, let's move onto a challenge. Feel free to reference back to any of these pages as needed.
 
 */
/*:
 [Previous](@prev) | [Next](@next)
 */
