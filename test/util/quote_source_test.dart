
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_scat/util/quote_category.dart';
import 'package:pocket_scat/util/quote_source.dart';

void main() {
  test('should search on name', () {
    const source = QuoteSource('Some Show', QuoteCategory.KIDS_TV, 'foo');
    expect(source.containsSearchTerm('some show'), true);
    expect(source.containsSearchTerm('sOmE sHoW'), true);
    expect(source.containsSearchTerm('SHOW'), true);
    expect(source.containsSearchTerm('foo'), false);
  });

  test('should search on search terms', () {
    const source = QuoteSource('Some Show', QuoteCategory.KIDS_TV, 'foo', 'other search terms');
    expect(source.containsSearchTerm('some show'), true);
    expect(source.containsSearchTerm('Other SEARCH'), true);
  });

  test('should be searchable by quote category', () {
    const source = QuoteSource('Some Show', QuoteCategory.SITCOM, '');
    expect(source.containsSearchTerm('sitcom'), true);
    expect(source.containsSearchTerm('SiTcOm'), true);
    expect(source.containsSearchTerm('kids tv'), false);
  });
}