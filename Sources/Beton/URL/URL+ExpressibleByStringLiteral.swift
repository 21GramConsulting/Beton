import Foundation

extension URL: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    guard let url = URL(string: value) else {
      preconditionFailure("Couldn't initialize URL from literal as it resolved to nil.")
    }
    self = url
  }
}
