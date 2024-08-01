import Foundation

extension Bundle {
  public var localizationBundles: [Locale: Bundle] {
    localizations
      .compactMap { [self] in
        guard let path = path(forResource: $0, ofType: "lproj") else { return nil }
        guard let bundle = Bundle(path: path) else { return nil }
        return (key: Locale(identifier: $0), value: bundle)
      }
      .reduce([:]) { (bundles: [Locale: Bundle], entry: (key: Locale, value: Bundle)) in
        var bundles = bundles
        bundles[entry.key] = entry.value
        return bundles
      }
  }
}
