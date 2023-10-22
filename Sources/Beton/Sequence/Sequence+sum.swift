import Foundation

extension Sequence where Self.Element: AdditiveArithmetic {
  /// Returns the sum of all elements in the sequence.
  ///
  /// The following examples show how to use `@CodeVoice(sum)` on different sequences.
  ///
  /// ```swift
  /// let arraySum = [1.1, 2.2, 3.3, 4.4, 5.5].sum()
  /// // arraySum == 16.5
  ///
  /// let rangeSum = (1..<10).sum()
  /// // rangeSum == 45
  ///
  /// let setSum = Set(arrayLiteral: 1, 2, 3, 2, 3).sum()
  /// // setSum == 6
  /// ```
  ///
  /// - Returns: The total of the elements. If the sequence has no elements, returns
  /// `@Link(identifier: "https://developer.apple.com/documentation/swift/additivearithmetic/3126829-zero", text: "zero")`.

  public func sum() -> Element { reduce(.zero, +) }
}
