import Darwin
import Foundation

@main
struct PrebuiltMacroProxy {
    static func main() throws {
        let toolPath = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .appendingPathComponent("CasePathsMacros-tool")
            .path
        var arguments: [UnsafeMutablePointer<CChar>?] = [strdup(toolPath), nil]
        defer { arguments.compactMap { $0 }.forEach { free($0) } }

        let result = toolPath.withCString { path in
            arguments.withUnsafeMutableBufferPointer { buffer in
                execv(path, buffer.baseAddress!)
            }
        }
        throw NSError(domain: NSPOSIXErrorDomain, code: Int(result == -1 ? errno : EIO))
    }
}