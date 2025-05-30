# PrintDebug

A Swift debugging library that provides Rust-inspired debugging tools.

## Features

- **`#dbg` Macro**: Rust-inspired debugging macro that prints values with source location context
- **`inspect` Method**: Fluent debugging method for method chaining scenarios
- **Source Location Tracking**: Shows file, function, and line number information
- **Beautiful Output**: Uses [CustomDump](https://github.com/pointfreeco/swift-custom-dump) for structured, readable output
- **Non-intrusive**: Returns values unchanged, allowing inline debugging without breaking code flow

## Installation

### Swift Package Manager

Add PrintDebug to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/PrintDebug.git", from: "X.X.X")
]
```

Or add it through Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Select your desired version

## Usage

### #dbg macro

The `#dbg` macro is perfect for quick debugging of expressions and variables:

```swift
import PrintDebug

func calculate(_ x: Int, _ y: Int) -> Int {
    let result = x * y + 10
    #dbg(x, y, result)
    return result
}

// Output:
// ▷ calculate(_:_:) [main.swift:35]
// x: 5
// y: 3
// result: 25

// Inline usage (returns values unchanged)

let numbers = [1, 2, 3, 4, 5]
let (a, b) = #dbg(numbers.first, numbers.last)

// Output:
// ▷ PrintDebugClient [main.swift:44]
// numbers.first: 1
// numbers.last: 5
```

### inspect method

The `inspect` method is ideal for method chaining and functional programming:

```swift
let result = [1, 2, 3, 4, 5]
    .inspect("original array")
    .filter { $0 > 2 }
    .inspect("after filter")
    .map { $0 * 2 }
    .inspect("after map")

// Output:
// ▷ PrintDebugClient [main.swift:101]
// original array: [
//   [0]: 1,
//   [1]: 2,
//   [2]: 3,
//   [3]: 4,
//   [4]: 5
// ]
//
// ▷ PrintDebugClient [main.swift:103]
// after filter: [
//   [0]: 3,
//   [1]: 4,
//   [2]: 5
// ]
//
// ▷ PrintDebugClient [main.swift:105]
// after map: [
//   [0]: 6,
//   [1]: 8,
//   [2]: 10
// ]
```

## Supported types

`#dbg` supports all Swift types and `inspect` is provided in extensions on:

- **Sequence**: Arrays, Sets, and other collections
- **Optional**: Debug optional values in chains
- **Result**: Debug Result types in error handling flows

## When to Use Each Tool

### Use `#dbg` for:
- Quick debugging of expressions and variables
- Multi-value debugging in a single call
- When you want to see the actual expression text
- Simple debugging scenarios

### Use `inspect` for:
- Method chaining scenarios
- Functional programming pipelines
- When you don't want to break the flow of your code

## Examples

For more comprehensive examples of usage, see [`Sources/PrintDebugClient/main.swift`](Sources/PrintDebugClient/main.swift).

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 6.0+
- Xcode 15.0+

## Dependencies

- [swift-syntax](https://github.com/swiftlang/swift-syntax) - For macro implementation
- [swift-custom-dump](https://github.com/pointfreeco/swift-custom-dump) - For beautiful output formatting

## License

PrintDebug is available under the Apache License, Version 2.0 - see the [LICENSE](LISCENCE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
