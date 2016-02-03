/*:
# Swift Cheat Sheet

## Constants, Variables and Basic Types
*/

let pi = 3.14159
var radius = 5.0
let avogadro = 6.02e23

/*:
### Mutability

vars are mutable. let constants are not. So radius can be reassigned:
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

let sixtyFiveDecimal = 65
let sixtyFiveBinary = 0b1000001
let sixtyFiveOctal = 0o101
let sixtyFiveHex = 0x41

/*:
### Range: Int32 vs. Int64

Most of the time you should let the compiler decide what precision to use. However, if you have a reason for making an Int of a particular range, you can:
*/

let sixtyFiveAsInt8 = Int8(65)

/*:
### Booleans

Swift has a Bool type, and two boolean literals:
*/

let ourAmpsGoTo11 = true
var ampIsOn = false

/*:
### Tuples

Like Python, the language allows for tuples:
*/

let model = (787, "Dreamliner")

/*:
## Type Aliases

Apple makes heavy use of type aliases in its frameworks. For example, CGRect is a type alias for a struct with four CGFloats. It isn't really your business whether a CGFloat is a Float or a Double, and on different Apple platforms, it may be different. Swift has the typealias feature and Apple uses it to insulate your code from the platform. Here is one way of making a CGRect:
*/

import AppKit

let whole27InchScreen: CGRect = CGRectMake(0.0, 0.0, 2560.0, 1440.0)

/*:
In the above declaration, the type CGRect could have been omitted because it can be infered from the return type of the function CGRectMake().

### Defining New Type Aliases

You can create your own type aliases. This would allow for 65536 Faculty IDs:
 */

typealias FacultyId = UInt16

/*:
By the way, usually it is a mistake (a kind of premature optimization) to start trimming away on your data types. In the present, case, even if you were extremely confident that the school will never need more than 65536 faculty IDs, it might still be the case that you don't want to hand them out sequentially, in which case. At least, if you consistently use the type alias, you only have to change what it is an alias for in one place.

## Optionals

What should the return type of a function that locates a substring within a string be? For example, you might look for the position of "bar" within  ...*/



