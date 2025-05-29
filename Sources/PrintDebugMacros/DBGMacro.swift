import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

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
            .map { "\"\($0)\"" }
            .joined(separator: ", ")

        return "_dbg(\(raw: argumentList), labels: \(raw: labelsList))"
    }
}

@main
struct PrintDebugPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DBGMacro.self,
    ]
}

