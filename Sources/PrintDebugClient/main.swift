import PrintDebug

// # PrintDebug Examples
//
// This file demonstrates the core PrintDebug tools for Swift development debugging.
// PrintDebug provides two main debugging utilities:
//
// ## #dbg Macro
// A Rust-inspired debugging macro that prints values with source location context.
// - **Transparent**: Returns the same values passed to it (usable inline)
// - **Multi-argument**: Supports debugging multiple values simultaneously
// - **Context-aware**: Shows file, function, and line number information
// - **Expression-preserving**: Can wrap any expression without changing behavior
//
// ## .inspect() Method
// A fluent debugging method for method chaining scenarios.
// - **Chainable**: Works seamlessly in fluent APIs and method chains
// - **Type-aware**: Available on Sequence, Optional, and Result types
// - **Non-intrusive**: Doesn't break existing code flow
// - **Location-tracking**: Provides same context information as #dbg
//
// Both tools use CustomDump from Point-Free for beautiful, structured output.

// MARK: DBG

print("******* Basic Usage *******\n")

#dbg(1 + 2, 10 * 3)

let numbers = [1, 2, 3, 4, 5]
#dbg(numbers, numbers.count)

func calculate(_ x: Int, _ y: Int) -> Int {
    let result = x * y + 10
    #dbg(x, y, result)
    return result
}

let calcResult = calculate(5, 3)

print("\n******* Inline Usage (returns values) *******\n")

let doubled = #dbg(numbers.last! * 2)
let (a, b) = #dbg(numbers.first, numbers.last)

let result = #dbg(numbers)
    .filter { $0 > 2 }

print("\n******* Custom Types *******\n")

let user = User(name: "Alice", age: 30, email: "alice@example.com")
#dbg(user)

let products = [
    Product(id: 1, name: "Laptop", price: 999.99, inStock: true),
    Product(id: 2, name: "Mouse", price: 29.99, inStock: false)
]
#dbg(products.filter { $0.inStock })

print("\n******* Optionals *******\n")

let optional: String? = "test"
#dbg(optional, optional?.uppercased())

let data = ["apple": 5, "banana": 3]
#dbg(data.values.reduce(0, +))

print("\n******* Long Function Signature *******\n")

// Function signatures that are longer than 50 characters are trimmed so that only the function name is displayed.

func processUserDataWithValidationAndTransformation(
    userData: User,
    validationRules: [String: Any],
    transformationOptions: [String: Bool],
    outputFormat: String,
    includeMetadata: Bool = true,
    debugMode: Bool = false
) -> [String: Any] {
    let result: [String: Any] = [
        "processed": true,
        "user": userData.name,
        "format": outputFormat
    ]
    #dbg(userData, validationRules, result)
    return result
}

let longResult = processUserDataWithValidationAndTransformation(
    userData: user,
    validationRules: ["age": "positive"],
    transformationOptions: ["uppercase": true],
    outputFormat: "json"
)

// MARK: - Inspect

print("\n******* Inspect Sequence *******\n")

let inspectResult = [1, 2, 3, 4, 5]
    .inspect("original array")
    .filter { $0 > 2 }
    .inspect("after filter")
    .map { $0 * 2 }
    .inspect("after map")

print("\n******* Inspect Optional *******\n")

let numberString: String? = "42"
let parsedAndDoubled = numberString
    .inspect("input string")
    .flatMap { Int($0) }
    .inspect("parsed to int")
    .map { $0 * 2 }
    .inspect("doubled result")

print("\n******* Inspect Result *******\n")

let userProfile = user.fetchProfile()
    .inspect("user profile result")
    .map { $0.uppercased() }
    .inspect("shouting profile")
