import 'package:find_that_kid/Model/location.dart';

abstract class BaseKidLocationRepository {
  Future<Location?> getChildLocation({
    required String id,
  }) async {}
}
