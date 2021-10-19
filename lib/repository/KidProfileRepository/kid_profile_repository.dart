import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_that_kid/Model/kid_profile.dart';
import 'package:find_that_kid/repository/KidProfileRepository/base_kid_profile_repository.dart';

class KidProfileRepository extends BaseKidProfileRepository {
  final FirebaseFirestore _firebaseFirestore;

  KidProfileRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<KidProfile> getKidProfile({
    required String id,
  }) async {
    return KidProfile.fromSnapshot(
        await _firebaseFirestore.collection('KidProfile').doc(id).get());
  }
}
