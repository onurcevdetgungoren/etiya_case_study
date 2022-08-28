import 'package:etiya_case_study/data/models/filter.dart';

abstract class FilterBase {
  Future<Filter> getPlatformFilters();
}
