// ignore_for_file: non_constant_identifier_names

import 'package:find_that_kid/Model/kid_profile.dart';
import 'package:find_that_kid/Model/location.dart';
import 'package:find_that_kid/Model/lost_notice.dart';

abstract class BaseLostNoticeRepository {
  postNewComment({
    required List<Map<String, dynamic>> comment,
    required String id,
  });

  Stream<List<LostNotice>> getAllLostNotices();

  createLostNotice({
    required String id,
    required String description,
    required Location location,
    required KidProfile kidProfile,
  });

  deleteLostNotice({
    required String id,
  });
}
