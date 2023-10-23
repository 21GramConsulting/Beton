import Foundation

/// A utility protocol for any value that can be associated with a locale.
///
/// This is useful for values that represent localized
//// constructs, are locale loaders, or operate with
/// locales in any way.
/// By extending this protocol, you can have decoupled units
/// carrying their own Localization info with them.
///
/// Typically this is handy in server-side environments.
public protocol LocaleAware {
  var locale: Locale? { get set }
}
