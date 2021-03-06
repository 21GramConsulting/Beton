#!/usr/bin/env swift

import Foundation

// Helpers
func /(url: URL, component: String) -> URL { url.appendingPathComponent(component) }

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
// END: Helpers

protocol Chunk: CustomStringConvertible {
  static var marker: String { get }
}

extension Chunk {
  func replaceMarker(in text: String) -> String {
    text.replacingOccurrences(of: "//GENERATE: \(Self.marker)", with: description)
  }
}

struct DocumentModules: Chunk {
  static let marker = "MODULES"
  let modules: [Module]

  var description: String {
    modules.map { description(for: $0) }.joined(separator: "\n")
  }

  private func description(for module: Module) -> String {
    "- [\(module.name)](#using-the-\(module.name.lowercased())-module): \(module.description)"
  }
}

struct ModuleUsages: Chunk {
  static let marker = "USAGES"
  let modules: [Module]

  var description: String {
    modules.map { usage(for: $0) }.joined(separator: "\n")
  }

  private func usage(for module: Module) -> String {
    do {
      let usage = try String(contentsOf: docsDirectory / module.name / "Usage.md")
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

struct ReleaseVersion: Chunk {
  static let marker = "LATEST_RELEASE_VERSION"
  let releaseVersion: String

  var description: String { releaseVersion }
}

let latestReleaseVersion = "1.0.0"

let currentDirectory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
let docsDirectory    = currentDirectory / "docs"
let generatedDocs    = docsDirectory / "generated"
let readmeTemplate   = docsDirectory / "README-template.md"
let readme           = currentDirectory / "README.md"

try! FileManager.default.createDirectory(at: generatedDocs, withIntermediateDirectories: true)

struct Module {
  let name:        String
  let description: String
}

let modules = [
  Module(
    name: "Beton",
    description: "Generic purpose functionalities that may be useful for every application."
  ),
  Module(
    name: "XCTBeton",
    description: """
                 Extends the capabilities of [XCTest](https://developer.apple.com/documentation/xctest) by
                 providing assertions for performance measurements.
                 """
  ),
]

func makeReadme() {
  do {
    let template        = try String(contentsOf: readmeTemplate)
    let chunks: [Chunk] = [
      DocumentModules(modules: modules),
      ModuleUsages(modules: modules),
      ReleaseVersion(releaseVersion: latestReleaseVersion)
    ]
    let content = chunks.reduce(template) { result, chunk in chunk.replaceMarker(in: result) }
    try content.write(to: readme, atomically: true, encoding: .utf8)
  } catch {
    dump(error)
    exit(1)
  }
}

func makeReadme(for module: Module) -> URL {
  do {
    let usage = try String(contentsOf: docsDirectory / module.name / "Usage.md")
    let content = """
                  # \(module.name)

                  `\(module.name)` is a module of the `Beton` library which contains multiple modules:

                  \(modules.map { "- [\($0.name)](../\($0.name.lowercased())/index.html)" }.joined(separator: "\n"))

                  ## Usage

                  \(usage)

                  ## Adding as a Dependency

                  To use the `\(module.name)` in a SwiftPM project, add it to the dependencies for your package and your target.

                  ```swift
                  // swift-tools-version:5.5.0

                  import PackageDescription

                  let package = Package(
                    name: "MyApplication",
                    dependencies: [
                      .package(url: "https://github.com/21GramConsulting/Beton", from: "\(latestReleaseVersion)"),
                    ],
                    targets: [
                      .target(name: "MyApplication", dependencies: [
                        .product(name: "\(module.name)", package: "Beton"),
                      ])
                    ]
                  )
                  ```
                  """
    let readme = generatedDocs / "\(module.name).md"
    try content.write(to: readme, atomically: true, encoding: .utf8)
    return readme
  } catch {
    dump(error)
    exit(1)
  }
}

func addGoogleSiteVerification(for module: Module) {
  do {
    let indexHtml = generatedDocs / module.name.lowercased() / "index.html"
    try String(contentsOf: indexHtml)
            .replacingOccurrences(
              of: "(.*)(<meta charset='utf-8'>)",
              with: "$1$2\n$1<meta name=\"google-site-verification\" content=\"hpaY76FpqCUjN6FjYXxXGLtER5n2qplgoV98C3CegpQ\" />",
              options: .regularExpression
            )
            .write(to: indexHtml, atomically: true, encoding: .utf8)
  } catch {
    dump(error)
    exit(1)
  }
}

makeReadme()

for module in modules {
  // `.path` is kind of necessary. Otherwise URL behaves strangely in script. Investigate the 'why' at the some point.
  let moduleDoc    = (generatedDocs / module.name.lowercased()).path
  let moduleReadme = makeReadme(for: module)
  try """
      jazzy
      --author="21Gram Technology Kft."
      --author-url="https://21gram.hu"
      --source-host-url="https://github.com/21GramConsulting/Beton"
      --module=\(module.name)
      --title="Swift Beton Docs - \(module.name) module"
      --readme=\(moduleReadme.path)
      --undocumented-text=""
      --theme=jony
      --output=\(moduleDoc)
      """.runAsCommand()
  addGoogleSiteVerification(for: module)
}
