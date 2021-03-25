enum QuoteCategory {
  SKETCH,
  SITCOM,
  GAME,
  KIDS_TV,
  MISC
}

extension QuoteCategoryExt on QuoteCategory {
  String description() {
    switch (this) {
      case QuoteCategory.SKETCH:
        return 'Sketches';
      case QuoteCategory.SITCOM:
        return 'Sitcom';
      case QuoteCategory.GAME:
        return 'Games';
      case QuoteCategory.KIDS_TV:
        return 'Kids TV';
      case QuoteCategory.MISC:
        return 'Misc';
    }
  }
}