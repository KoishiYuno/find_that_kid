// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_that_kid/Model/kid_profile.dart';
import 'package:find_that_kid/Model/location.dart';
import 'package:find_that_kid/Model/lost_notice.dart';
import 'package:find_that_kid/repository/LostNoticeRepository/base_lost_notice_repository.dart';

class LostNoticeRepository extends BaseLostNoticeRepository {
  final FirebaseFirestore _firebaseFirestore;

  LostNoticeRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<LostNotice>> getAllLostNotices() {
    return _firebaseFirestore
        .collection('LostNotices')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((docs) => LostNotice.fromSnapshot(docs))
          .toList();
    });
  }

  @override
  postNewComment({
    required List<Map<String, dynamic>> comment,
    required String id,
  }) {
    // List<Map<String, dynamic>> someData = [
    //   {
    //     'username': 'sam',
    //     'text': 'something',
    //   }
    // ];
    FirebaseFirestore.instance
        .collection('LostNotices')
        .doc(id)
        .update({'comment': FieldValue.arrayUnion(comment)});
  }

  @override
  createLostNotice({
    required String id,
    required String description,
    required Location location,
    required KidProfile kidProfile,
  }) {
    final LostNotice lostNotice = LostNotice(
        avatarPath: kidProfile.avatarPath,
        lastname: kidProfile.lastname,
        firstname: kidProfile.firstname,
        gender: kidProfile.gender,
        height: kidProfile.height,
        weight: kidProfile.weight,
        id: 'myid',
        description: description,
        parentName: 'Van LightHolme',
        email: 'vanlightholme@gmail.com',
        phone: '1234567890',
        place: location.place,
        time: location.date,
        age: kidProfile.age,
        comment: []);

    _firebaseFirestore
        .collection('LostNotices')
        .doc(id)
        .get()
        .then((docData) => {
              if (!docData.exists)
                {
                  _firebaseFirestore
                      .collection("LostNotices")
                      .doc("test")
                      .set(lostNotice.toJson())
                }
              else
                {print('document already exist')}
            });
  }
}
