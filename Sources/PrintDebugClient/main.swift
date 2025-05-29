import PrintDebug

/// PrintDebug Example Client
///
/// This file demonstrates various ways to use the #dbg macro.
/// Key features:
/// - Returns the same values passed to it (transparent)
/// - Can be used inline in expressions  
/// - Supports multiple arguments
/// - Shows file, function, and line in output

// MARK: - Basic Usage

print("******* Basic Usage *******\n")

#dbg(1 + 2, 10 * 3)

let numbers = [1, 2, 3, 4, 5]
#dbg(numbers, numbers.count)


// MARK: - Inline Usage (returns values)

print("\n******* Inline Usage (returns valuds) *******\n")

let doubled = #dbg(numbers.last! * 2)
let (a, b) = #dbg(numbers.first, numbers.last)

let result = #dbg(numbers)
    .filter { $0 > 2 }
    .map { #dbg($0 * 2) }

// MARK: - Custom Types

print("\n******* Custom Types *******\n")

let user = User(name: "Alice", age: 30, email: "alice@example.com")
#dbg(user)

let products = [
    Product(id: 1, name: "Laptop", price: 999.99, inStock: true),
    Product(id: 2, name: "Mouse", price: 29.99, inStock: false)
]
#dbg(products.filter { $0.inStock })

// MARK: - Optionals

print("\n******* Optionals *******\n")

let optional: String? = "test"
#dbg(optional, optional?.uppercased())

let data = ["apple": 5, "banana": 3]
#dbg(data.values.reduce(0, +))

// MARK: - In Function

print("\n******* In Function *******\n")

func calculate(_ x: Int, _ y: Int) -> Int {
    let result = x * y + 10
    #dbg(x, y, result) // prints "...in calculate(_:_:)..."
    return result
}

let calcResult = calculate(5, 3)
