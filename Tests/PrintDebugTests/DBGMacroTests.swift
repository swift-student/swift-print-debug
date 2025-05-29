
#if canImport(PrintDebugMacros)

import MacroTesting
import PrintDebugMacros
import XCTest

final class PrintDebugTests: XCTestCase {

    override func invokeTest() {
        withMacroTesting(macros: [
            "dbg": DBGMacro.self,
        ]) {
            super.invokeTest()
        }
    }

    func testMacro() throws {
        assertMacro {
            "#dbg(1 + 2)"
        } expansion: {
            """
            _dbg(1 + 2, labels: "1 + 2")
            """
        }
    }
    
    func testMultipleArguments() throws {
        assertMacro {
            "#dbg(x, y, z)"
        } expansion: {
            """
            _dbg(x, y, z, labels: "x", "y", "z")
            """
        }
    }
    
    func testComplexExpressions() throws {
        assertMacro {
            "#dbg(user.name, items.count, calculate(a, b))"
        } expansion: {
            """
            _dbg(user.name, items.count, calculate(a, b), labels: "user.name", "items.count", "calculate(a, b)")
            """
        }
    }
    
    func testStringLiterals() throws {
        assertMacro {
            "#dbg(\"hello\", \"world\")"
        } expansion: {
            """
            _dbg("hello", "world", labels: "\\\"hello\\\"", "\\\"world\\\"")
            """
        }
    }
    
    func testArrayAndDictionary() throws {
        assertMacro {
            "#dbg([1, 2, 3], [\"key\": \"value\"])"
        } expansion: {
            """
            _dbg([1, 2, 3], ["key": "value"], labels: "[1, 2, 3]", "[\\\"key\\\": \\\"value\\\"]")
            """
        }
    }
    
    func testReturnValue() throws {
        assertMacro {
            "let result = #dbg(42) + 10"
        } expansion: {
            """
            let result = _dbg(42, labels: "42") + 10
            """
        }
    }
    
    func testMultipleReturnValues() throws {
        assertMacro {
            "let (a, b) = #dbg(10, 20)"
        } expansion: {
            """
            let (a, b) = _dbg(10, 20, labels: "10", "20")
            """
        }
    }

}

#endif
