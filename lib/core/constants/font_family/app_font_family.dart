enum AppFontFamily {
  EuclidCircular,
}

extension AppFontFamilyValue on AppFontFamily {
  String get value {
    switch (this) {
      case AppFontFamily.EuclidCircular:
        return 'Euclid Circular B';

      default:
        return 'Euclid Circular B';
    }
  }
}
