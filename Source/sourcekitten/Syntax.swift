import SourceKittenFramework
import StackOtterArgParser

extension SourceKitten {
  struct Syntax: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Print Swift syntax information as JSON")

    @Option(help: "Relative or absolute path of Swift file to parse")
    var file: String = ""
    @Option(help: "Swift code text to parse")
    var text: String = ""

    mutating func run() throws {
      if !file.isEmpty {
        if let file = File(path: file) {
          try print(SyntaxMap(file: file))
          return
        }
        throw SourceKittenError.readFailed(path: file)
      }
      try print(SyntaxMap(file: File(contents: text)))
    }
  }
}
