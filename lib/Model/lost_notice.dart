// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'comment.dart';

class LostNotice extends Equatable {
  final String id;
  final String avatarPath;
  final String lastname;
  final String firstname;
  final String gender;
  final int height;
  final int weight;
  final String description;
  final String parentName;
  final String email;
  final String phone;
  final String place;
  final int age;
  final int time;
  final List<Comment> comment;

  LostNotice({
    required this.avatarPath,
    required this.lastname,
    required this.firstname,
    required this.gender,
    required this.height,
    required this.weight,
    required this.id,
    required this.description,
    required this.parentName,
    required this.email,
    required this.phone,
    required this.place,
    required this.time,
    required this.age,
    required this.comment,
  });

  @override
  List<Object?> get props => [
        avatarPath,
        lastname,
        firstname,
        gender,
        height,
        weight,
        id,
        description,
        parentName,
        email,
        phone,
        place,
        time,
        age,
        comment,
      ];

  static LostNotice fromSnapshot(DocumentSnapshot snap) {
    final comment = snap['comment']
        .map<Comment>((comments) => Comment.fromJson(comments))
        .toList();
    LostNotice lostNotice = LostNotice(
        avatarPath: snap['avatarPath'],
        lastname: snap['lastname'],
        firstname: snap['firstname'],
        gender: snap['gender'],
        height: snap['height'],
        weight: snap['weight'],
        id: snap['id'],
        description: snap['description'],
        parentName: snap['parentName'],
        email: snap['email'],
        phone: snap['phone'],
        place: snap['place'],
        time: snap['time'],
        age: snap['age'],
        comment: comment);

    return lostNotice;
  }

  Map<String, dynamic> toJson() => {
        'avatarPath': avatarPath,
        'lastname': lastname,
        'firstname': firstname,
        'gender': gender,
        'height': height,
        'weight': weight,
        'id': id,
        'description': description,
        'parentName': parentName,
        'email': email,
        'phone': phone,
        'place': place,
        'time': time,
        'age': age,
        'comment': comment,
      };

  // static List<LostNotice> lostNotices = [
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 1,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 2,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 3,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 4,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 5,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 6,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 7,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 8,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 9,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 10,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 11,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 12,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  //   LostNotice(
  //     firstname: "Van",
  //     lastname: "Darkholme",
  //     avatarPath:
  //         "https://i1.sndcdn.com/artworks-000260163743-nwua7w-t500x500.jpg",
  //     gender: 'male',
  //     height: 180,
  //     weight: 75,
  //     place: 'Queen Street',
  //     id: 13,
  //     description:
  //         "Content reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information and opinions expressed by this content do not necessarily represent those of MariaDB or any other party. ",
  //     parentName: "Van Dad",
  //     email: "dadofvan.gmail.com",
  //     phone: "1234567890",
  //     time: 1633283375455,
  //     age: 15,
  //     comment: [
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //       Comment(
  //           username: 'Sam',
  //           text:
  //               'Some useful infomration: ontent reproduced on this site is the property of its respective owners, and this content is not reviewed in advance by MariaDB. The views, information an'),
  //     ],
  //   ),
  // ];

  // factory LostNotice.fromJson(Map<String, dynamic> json) => LostNotice(
  //     avatarPath: json['avatarPath'],
  //     lastname: json['lastname'],
  //     firstname: json['firstname'],
  //     gender: json['gender'],
  //     height: json['height'],
  //     weight: json['weight']);

  // Map toJson() => {
  //       'avatarPath': avatarPath,
  //       'lastname': lastname,
  //       'firstname': firstname,
  //       'gender': gender,
  //       'height': height,
  //       'weight': weight
  //     };
}
