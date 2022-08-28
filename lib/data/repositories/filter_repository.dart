import 'package:etiya_case_study/data/datasource/filter_client.dart';
import 'package:etiya_case_study/data/models/filter.dart';
import 'package:etiya_case_study/domain/repositories/filter_base.dart';
import 'package:etiya_case_study/locator.dart';

class FilterRepository implements FilterBase {
  final _gameClient = locator<FilterClient>();

  @override
  Future<Filter> getPlatformFilters() async {
    return _gameClient.getPlatformFilters();
  }
}
