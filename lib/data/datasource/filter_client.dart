import 'package:etiya_case_study/data/datasource/dio_client.dart';
import 'package:etiya_case_study/data/models/filter.dart';
import 'package:etiya_case_study/domain/repositories/filter_base.dart';
import 'package:etiya_case_study/locator.dart';

class FilterClient implements FilterBase {
  final DioClient _dioClient = locator<DioClient>();
  final String apiKey = "db44f0a34ed24498a3d19b7133b7a571";

  //Get Filter
  @override
  Future<Filter> getPlatformFilters() async {
    try {
      var result = await _dioClient.dio.get("platforms", queryParameters: {
        "key": apiKey,
      });
      var data = Filter.fromMap(result.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
