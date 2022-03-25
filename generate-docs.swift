#!/usr/bin/env swift

import Foundation

let currentDirectory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
let docsDirectory    = currentDirectory.appendingPathComponent("docs")
let generatedDocs    = docsDirectory.appendingPathComponent("generated")
let readmeTemplate   = docsDirectory.appendingPathComponent("README-template.md")
let readme           = generatedDocs.appendingPathComponent("README.md")

try! FileManager.default.createDirectory(at: generatedDocs, withIntermediateDirectories: true)

struct Module: CustomStringConvertible {
  let name:          String
  let documentation: String

  var description: String {
    """
    ### \(name)

    \(documentation)

    See the [API docs](../\(name.lowercased())/index.html).

    """
  }
}

let modules = [
  Module(
    name: "Beton",
    documentation: "The `Beton` module offers generic purpose functionalities that may be useful for every application."
  ),
  Module(
    name: "XCTBeton",
    documentation: """
                   The `XCTBeton` module extends the capabilities of [XCTest](https://developer.apple.com/documentation/xctest) by
                   providing assertions for performance measurements.
                   """
  ),
]

// TODO: Rework this.
func makeReadmeFor(module: Module) -> URL {
  var template = ""
  do {
    template = try String(contentsOf: readmeTemplate)
    let content = template
            .lines
            .map { line in
              switch line {
              case _ where DocumentModules.matches(line: line): return DocumentModules(modules: modules).description
              case _ where ModuleUsage.matches(line: line): return ModuleUsage(module: module).description
              default: return line
              }
            }
            .joined(separator: "\n")
    let moduleReadme = generatedDocs.appendingPathComponent("\(module.name).md")
    try content.write(to: moduleReadme, atomically: true, encoding: .utf8)
    return moduleReadme
  } catch {
    dump(error)
    exit(1)
  }
}

for module in modules {
  // `.path` is kind of necessary. Otherwise URL behaves strangely in script. Investigate the 'why' at the some point.
  let moduleDoc = generatedDocs.appendingPathComponent(module.name.lowercased()).path
  let moduleReadme = makeReadmeFor(module: module)
  try """
      jazzy
      --author="21Gram Technology Kft."
      --author-url="https://21gram.hu"
      --source-host-url="https://github.com/21GramConsulting/Beton"
      --module=\(module.name)
      --title="Swift Beton Docs - \(module.name) module"
      --readme=\(moduleReadme.path)
      --undocumented-text=""
      --output=\(moduleDoc)
      """.runAsCommand()
}

protocol Chunk: CustomStringConvertible {
  static var marker: String { get }
}

extension Chunk {
  static func matches(line: String) -> Bool {
    line
            .filter { !$0.isNewline && !$0.isWhitespace }
            .starts(with: "//GENERATE:\(marker)")
  }
}

struct DocumentModules: Chunk {
  static let marker = "MODULES"
  let modules: [Module]

  var description: String {
    modules.map(\.description).joined(separator: "\n")
  }
}

struct ModuleUsage: Chunk {
  static let marker = "USAGE"
  let module: Module

  var description: String { usage }

  var usage: String {
    let moduleUsage = docsDirectory.appendingPathComponent("\(module.name)-template.md")
    do {
      let usage = try String(contentsOf: moduleUsage)
      return """
             ## Using the \(module.name) Module

             \(usage)
             """
    } catch {
      dump(error)
      exit(1)
    }
  }
}

extension String {
  func runAsCommand(using shell: String = "/bin/bash") throws {
    let command = lines.joined(separator: " ")
    return try runShell(command, using: shell)
  }

  var lines: [String] { components(separatedBy: .newlines) }
}

// Based on: https://stackoverflow.com/a/50035059
func runShell(_ command: String, using shell: String = "/bin/bash") throws {
  let task = Process()
  task.arguments = ["-c", command]
  task.executableURL = URL(fileURLWithPath: shell)
  try task.run()
  task.waitUntilExit()
}
