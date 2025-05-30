import Foundation

func printLocation(
    file: StaticString,
    line: Int,
    function: StaticString
) {
    let formattedFunction = formatFunction(function)
    let formattedFile = formatFile(file)
    print("▷ \(formattedFunction) [\(formattedFile):\(line)]")
}

private func formatFunction(_ function: StaticString) -> String {
    let fullFunction = function.description
    return fullFunction.count > 50
        ? String(fullFunction.prefix(while: { $0 != "(" }))
        : fullFunction
}

private func formatFile(_ file: StaticString) -> String {
    file.description.components(separatedBy: "/").last ?? file.description
}
