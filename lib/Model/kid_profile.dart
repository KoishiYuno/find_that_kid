// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class KidProfile extends Equatable {
  final String avatarPath;
  final String lastname;
  final String firstname;
  final String gender;
  final int height;
  final int weight;
  final int age;

  KidProfile({
    required this.avatarPath,
    required this.lastname,
    required this.firstname,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  @override
  List<Object?> get props => [
        avatarPath,
        lastname,
        firstname,
        gender,
        height,
        weight,
        age,
      ];

  static KidProfile fromSnapshot(DocumentSnapshot snap) {
    KidProfile kidProfile = KidProfile(
      avatarPath: snap['avatarPath'],
      lastname: snap['lastname'],
      firstname: snap['firstname'],
      gender: snap['gender'],
      height: snap['height'],
      weight: snap['weight'],
      age: snap['age'],
    );

    return kidProfile;
  }
}
