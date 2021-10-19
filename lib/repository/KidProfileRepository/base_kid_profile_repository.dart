import 'package:find_that_kid/Model/kid_profile.dart';

abstract class BaseKidProfileRepository {
  Future<KidProfile> getKidProfile({
    required String id,
  });
}
