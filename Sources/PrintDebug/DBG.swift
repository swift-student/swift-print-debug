import CustomDump

/// This function is not meant to be called directly, instead you should use the `#dbg`macro.
@discardableResult
public func _dbg<each T>(
    _ values: repeat each T,
    labels: String...,
    file: StaticString = #fileID,
    line: Int = #line,
    function: StaticString = #function
) -> (repeat each T) {
    print("🔍 \(file) in \(function), line \(line):")
    var index = 0
    for value in repeat each values {
        customDump(value, name: index < labels.count ? labels[index] : nil)
        index += 1
    }
    return (repeat each values)
}

