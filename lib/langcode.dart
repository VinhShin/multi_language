enum LangCode {
  vn,
  en,
}

extension LangCodeExtend on LangCode {
  String get code {
    switch (this) {
      case LangCode.vn:
        return 'vn';
      case LangCode.en:
        return 'en';
      default:
        return null;
    }
  }

  String get names {
    switch (this) {
      case LangCode.vn:
        return 'Tiếng Việt';
      case LangCode.en:
        return 'English';
      default:
        return null;
    }
  }
}
