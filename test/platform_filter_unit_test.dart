import 'package:etiya_case_study/data/datasource/filter_client.dart';
import 'package:etiya_case_study/data/models/filter.dart';
import 'package:etiya_case_study/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();
  final filterClient = locator<FilterClient>();
  test("Get Platform Filters", () async {
    final response = await filterClient.getPlatformFilters();
    expect(response.results is List<Result>, true);
  });
}
