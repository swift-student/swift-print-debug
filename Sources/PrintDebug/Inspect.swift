import CustomDump
import Foundation

extension Sequence {
    @discardableResult
    public func inspect(
        _ label: String? = nil,
        file: StaticString = #fileID,
        line: Int = #line,
        function: StaticString = #function
    ) -> Self {
        printLocation(file: file, line: line, function: function)
        customDump(self, name: label)
        print("")
        return self
    }
}

extension Optional {
    @discardableResult
    public func inspect(
        _ label: String? = nil,
        file: StaticString = #fileID,
        line: Int = #line,
        function: StaticString = #function
    ) -> Self {
        printLocation(file: file, line: line, function: function)
        customDump(self, name: label)
        print("")
        return self
    }
}

extension Result {
    @discardableResult
    public func inspect(
        _ label: String? = nil,
        file: StaticString = #fileID,
        line: Int = #line,
        function: StaticString = #function
    ) -> Self {
        printLocation(file: file, line: line, function: function)
        customDump(self, name: label)
        print("")
        return self
    }
}
