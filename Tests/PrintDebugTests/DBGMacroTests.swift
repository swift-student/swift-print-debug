
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

}

#endif
