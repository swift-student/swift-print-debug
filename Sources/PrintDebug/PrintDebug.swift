@freestanding(expression)
@discardableResult
public macro dbg<each T>(_ value: repeat each T) -> (repeat each T) = #externalMacro(module: "PrintDebugMacros", type: "DBGMacro")
