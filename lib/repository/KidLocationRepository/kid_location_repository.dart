import 'package:find_that_kid/Model/location.dart';
import 'package:find_that_kid/repository/KidLocationRepository/base_kid_location_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class KidLocationRepository extends BaseKidLocationRepository {
  KidLocationRepository();

  @override
  Future<Location> getChildLocation({
    required String id,
  }) async {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference().child(id);

    // double lat = 100.0;
    // double lng = 100.0;
    // Location location = Location(
    //     state: 'sos',
    //     lat: lat,
    //     lng: lng,
    //     date: DateTime.now().millisecondsSinceEpoch);

    // _testRef.set(location.toJson());

    var json = await _testRef.once().then((DataSnapshot snapshot) {
      return snapshot.value as Map<dynamic, dynamic>;
    });

    // print("json is ${json}");
    // print(DateTime.now().millisecondsSinceEpoch.runtimeType);
    final location = Location.fromJson(json);
    // print("location is:${location}");

    return location;
  }
}
