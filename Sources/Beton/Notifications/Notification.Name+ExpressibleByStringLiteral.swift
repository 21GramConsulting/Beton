extension Notification.Name: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) { self.init(String(value)) }
}
