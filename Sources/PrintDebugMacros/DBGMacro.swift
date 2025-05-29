import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// A macro that provides debug printing with automatic labeling of expressions.
///
/// The `#dbg` macro captures both the values and the source code of the expressions
/// passed to it, making debugging output more informative by showing what each
/// value represents.
///
/// Example usage:
/// ```swift
/// let x = 42
/// let name = "Alice"
/// #dbg(x, name, x + 10)
/// ```
///
/// This expands to:
/// ```swift
/// _dbg(x, name, x + 10, labels: "x", "name", "x + 10")
/// ```
///
/// The output will show the file, function, and line where the macro was called,
/// along with each value and its corresponding expression.
public struct DBGMacro: ExpressionMacro {

    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard !node.arguments.isEmpty else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let argumentExpressions = node.arguments.map { $0.expression }

        let argumentList = argumentExpressions
            .map { "\($0)" }
            .joined(separator: ", ")

        let labelsList = argumentExpressions
            .map(makeLabel)
            .joined(separator: ", ")

        return "_dbg(\(raw: argumentList), labels: \(raw: labelsList))"
    }

    private static func makeLabel(from expression: ExprSyntax) -> String {
        let exprString = "\(expression)".replacingOccurrences(of: "\"", with: "\\\"")
        return "\"\(exprString)\""
    }
    
}

@main
struct PrintDebugPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DBGMacro.self,
    ]
}

