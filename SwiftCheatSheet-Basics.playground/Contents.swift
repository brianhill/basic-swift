/*:
# Swift Cheat Sheet -- Basics

This cheat sheet covers the basics. Swift has some nice syntax as you'll see below, but it doesn't get really interesting until you get to the companion cheat sheet.

## Constants, Variables and Basic Types
*/

let pi = 3.14159
var radius = 5.5
let avogadro = 6.02e23

/*:
### Mutability

Anything declared as a var is mutable. Anything declared with a let is not. So radius is mutable, meaning that it can be reassigned:
*/

radius = 10.0

/*:
### Precision: Double vs. Float

Literal constants with decimal points in them are of type Double. Here are two ways to get Floats:
*/

let piAsFloat: Float = 3.14159
var radiusAsFloat = Float(5.0)

/*:
### Integers

Literal constants without decimal points are of type Int. Sometimes it is convenient to enter constants
in binary, octal and hexadecimal. All of these give the same integer:
*/

let sixtyFive = 65
let sixtyFiveBinary = 0b1000001
let sixtyFiveOctal = 0o101
let sixtyFiveHex = 0x41

/*:
### Precision: Int32 vs. Int64

Most of the time you should let the compiler decide what precision to use. However, if you have a reason for making an Int of a particular precision (aka width), you can:
*/

let sixtyFiveAsInt8 = Int8(65)

/*:
### Casts

You will often find yourself needing to cast from an integer type to a floating-point type. Here is an example of such a cast:
*/

let sixtyFiveAsDouble = Double(sixtyFive)

/*:
### Booleans

Swift has a Bool type, and two boolean literals:
*/

let ourAmpsGoTo11 = true
var ampIsOn = false

/*:
### Strings

Swift has Unicode strings: */

let cafe = "café" // Cannot be represented in ASCII, but can be represented in ISO-Latin-1
let tokyo = "東京都" // Cannot be represented in ISO-Latin-1.

/*:
Any language that doesn't support Unicode by default (like C++ and Python 2.x) pretty much force you into bad engineering practice. In Unicode 8.0, the Unicode Consortium added Ahom, Anatolian hieroglyphs, Hatran, Multani, Old Hungarian, SignWriting, 5,771 CJK unified ideographs, a set of lowercase letters for Cherokee and 41 emojis, including five emoji skin tone modifiers. Swift incorporated Unicode 8.0 into its codebase within weeks of its release in June, 2015. Java (from the get-go) and Ruby (as of Ruby 1.9) are Unicode.

### Tuples

Like Python, Swift allows for tuples which are used for grouping and returning multiple pieces of data:
*/

let boeingModelNumberAndName = (787, "Dreamliner")
let modelNumber = boeingModelNumberAndName.0
let name = boeingModelNumberAndName.1

let airbusModelNumberAndName = (modelNumber:320, name:"Airbus 320")
let airbusModelNumber = airbusModelNumberAndName.modelNumber
let airbusName = airbusModelNumberAndName.name

/*:

As you can see from the above examples, if the components of the tuple are not named, then they can be access by number.

## Type Aliases

Apple makes heavy use of type aliases in its frameworks. For example, CGRect is a type alias for a struct with four CGFloats. It isn't really your business whether a CGFloat is a Float or a Double, and on different Apple platforms, it may be different. Swift has the typealias feature and Apple uses it to insulate your code from the platform. Here is one way of making a CGRect:
*/

import CoreGraphics

var whole27InchScreen = CGRect(x:0.0, y:0.0, width:1440.0, height:2560.0)

/*:
In the above declaration, the type CGRect could have been omitted because it can be infered from the return type of the function CGRectMake().

### Defining New Type Aliases

You can create your own type aliases. This would allow for 65536 Faculty IDs and make it clearer in the code what a variable is used for just by its declaration:
 */

typealias FacultyId = UInt16

/*:
By the way, usually it is a mistake (a kind of premature optimization) to start trimming away on your data types. In the present, case, even if you were extremely confident that the school will never need more than 65536 faculty IDs, it might still be the case that for security reasons you don't want to hand them out sequentially, or that your database doesn't generate IDs sequentially.

## Optionals

What should the return type of a function that finds the position of a substring within a string be? For example, you might look for the position of "bar" within  "foobar", and the returned position would be 3. What if you looked for the position of "bar" within "foobaz"? Traditionally, some magic value would be returned, like -1. This kind of situation is so common that Swift has optionals: */

var position: Int?

/*: Your code that finds the position might start by setting position = nil. */

position = nil

/*: Only if it finds the substring might it then set it and return it. */

position = 3

/*: No integer is equal to nil. It represents the absence of an integer. Optionals and nil are available for any data type. 

### Unwrapping Optionals

If you know that position exists, you can unwrap it as follows:

*/

var definitelyAPosition = position!

/*: This test-then-assign idiom is so common, the language has a shorthand for it:
*/

if var oneBasedPosition = position {
    oneBasedPosition += 1
}

/*: 

## Operators

### Unary Operators

Increment and decrement (++ and --) are available in Swift up until 2.1, but they are being removed from the language for 2.2.

So it looks like the unary plus, unary minus, not, bitwise not and bitwise or (+, -, !, ~)) are the remaining unary operators:
*/

let ten = 10
let plusTen = +ten
let minusTen = -ten
let notTrue = !true
let oneSeventy: UInt8 = ~UInt8(85) // ~0b01010101 becomes 0b10101010

/*:

Instead of increment and decrement, they want you to just use += and -=, as I did when I made oneBasedPosition, above.

### Binary Operators

Swift has all the usual binary arithmetic operators: plus, minus, times, divided by, remainder (+, -, *, /, %) &mdash; but as in other languages, remainder with negative numbers can be kind of surprising: */

let minusFour = -24 % 10

/*:

It has the usual binary logic operators: logical and, logical or (&&, ||)

There is no exponentiation operator (**). Use the function pow(num, power).

*/

let sixtyFour = pow(4.0, 3.0)

/*:

There is a bitwise or (^):

*/

let twoFiftyFive = UInt8(85) ^ oneSeventy // 0b01010101 ^ 0b11111111 becomes 0b11111111

/*: Swift has the usual left shift and right shift operators (<< and >>): */

var eight = UInt8(0b1) << 3 // 0b00000001 left shifted by 3 is 0b00001000.
let four = eight >> 1 // 0b00001000 right shifted by 1 is 0b00000100.

/*:
### Overflow

It is an error to cause an overflow in addition, subtraction and multiplication. To allow an overflow, use overflow addition, overflow subtraction, overflow multiplication (&+, &-, &*):
*/

let eightyFour = oneSeventy &+ oneSeventy // 170 + 170 = 340, which overflows, so its 340 - 256 = 84.

/*:

There is no overflow division.

### Binary Comparison Operators

Swift has all the usual binary comparison operators: equals, not equals, greater than, less than, greater than or equal, less than or equal (==, !=, >, <, >=, <=).

There are also two binary identity comparison operators, which we'll get to when we discuss objects (=== and !==).

### Ternary Operators

Swift has the ternary conditional like C:

*/

var ledIsOn: Bool = true

let ledOnBrightness = 255.0, ledOffBrightness = 0.0

let ledBrightness = ledIsOn ? ledOnBrightness : ledOffBrightness

/*:

### Nil Coalescing Operator

There is another binary operator that is a shorthand for a common but clumsy ternary operation:
*/

var value : Int? = nil

var valueOrDefault: Int

valueOrDefault = (value != nil) ? value! : 42 // clumsy!

/*:
The nil-coalescing shorthand for this is:
*/

valueOrDefault = value ?? 42

/*:

### Assignment and Mutating Assignment Operators

Swift has the usual assigment and mutating assignment operators: assignment, assignment with addition, assignment with subtraction (=, +=, -=).

It also has some bitwise mutating assignment operators: assignment with bitwise or, assignment with bitwise and (^=, &=).

*/

var fifteen: UInt8 = 0b1111

fifteen |= 0b11110000 // 0b1111 | 0b11110000 gives 0b11111111, e.g., 255.

/*:

Does Swift have mutating assignment with logical or or mutating assignment with logical and (||=, &&=)? Nope.

## Arrays and Ranges

Here is an array of three strings:

*/

var nearbyStops = ["Orinda", "Lafayette", "Walnut Creek"]

let firstStop = nearbyStops[0]
let lastStop = nearbyStops[2]

/* Because they are used to make slices of arrays and to iterate over indices this is a good place to introduce ranges: */

let aRange = 1..<3 // completely equivalent to 1...2

var lastCoupleOfStops = nearbyStops[aRange]

/*:

This appends an element to the existing array neabyStops. It mutates it.

*/

nearbyStops.append("Pleasant Hill")

/*:

Now nearbyStops has four elements.

If nearbyStops had been defined with a let instead of var, this would have been an error.

## Enumerations

Swift has very nice enumerations. Here is an example declaration of an enumeration:

*/

enum ClockPhase {
    case High // the phase after a low-to-high transition -- usually known as the Tock phase
    case Low // the phase after a high-to-low transition -- usually known as the Tick phase
    case Unstable // during the transition
}

/*:

By "very nice," I mean not only do they add to readibility, but they also feed the switch statement in a non-error-prone way. See below.

## Control Flow

### Loops

With ranges, we now have one way of constructing loops:

*/

for i in 0..<4 {
    print(nearbyStops[i])
}

/*:

A better way of doing this loop is */

for stop in nearbyStops {
    print(stop)
}

/*:

The old school C-like version of the for loop is also supported:

*/

for var i: Int = nearbyStops.count - 1; i >= 0; --i {
    print(nearbyStops[i]) // runs through the stops array backwards
}

/*:

### While Do and Do While

Swift has both of these except to emphasize that the second one always iterates at least once, they called it "repeat-while."

*/

while nearbyStops.count > 0 {
    nearbyStops.removeLast() // removes all the stops
}

repeat {
    nearbyStops.append("Lafayette")
} while nearbyStops.count < 4

/*:

### Switch Statements (aka case statements)

The code below illustrates one of the main uses for the enumeration declared above:

*/

let phase = ClockPhase.High

switch phase {
case ClockPhase.High:
    // transition high-to-low
    print("transitioning high to low") // this is the one that will print
case ClockPhase.Low:
    // transition low-to-high
    print("transitioning low to high")
case ClockPhase.Unstable:
    print("oh my, this should hever happen")
}

/*:

Now nearbyStops contains "Lafayette" four times.

## Sets

Making a set literal looks almost the same as making an array literal:

*/
    
var setOfStops: Set = ["Rockridge", "Orinda", "Lafayette", "Walnut Creek", "Pleasant Hill"] // five members

setOfStops.remove("Pleasant Hill") // after the remove, setOfStops only has four members -- for your convenience this method returns whatever was removed

setOfStops.remove("Pleasant Hill") // you can try removing it again, but it has no effect and the method returns nil

setOfStops.insert("MacArthur")

/*:
In some languages, strings are also arrays of characters, and you can do things like this:

for (c in "MacArthur") {
    print(c)
}

This is awfully error-prone in practice, and Swift does not support it.

## Dictionaries (aka Maps)

Dictionaries map keys to values. Here is how you make a literal dictionary:

*/

var courses = ["MA/CS190": "Topic in Computer Science", "PHYS060": "Modern Physics", "PHYS011": "Intro to Physics II"]

var courseName = courses["MA/CS190"]

var allCourseNames = courses.values

for name in allCourseNames {
    print(name)
}

var coursesCount: Int = courses.count // get the number of key-value pairs in courses

/*:

Well, that's all the basics. See the companion cheat sheet for Swift's more advanced features.

*/
