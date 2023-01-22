import Foundation

extension URL: ExpressibleByStringLiteral {
  /// A convenience initializer that allows you to express a
  /// [`URL`](https://developer.apple.com/documentation/foundation/url) using a string literal.
  ///
  /// ```swift
  /// let assignmentExample: URL = "https://www.21gram.consulting/en-US"
  /// let (pageDownloadExample, _) = try await URLSession.shared.data(from: "https://www.21gram.consulting/en-US")
  /// ```
  public init(stringLiteral value: String) {
    guard let url = URL(string: value) else {
      preconditionFailure("Couldn't initialize URL from literal as it resolved to nil.")
    }
    self = url
  }
}
