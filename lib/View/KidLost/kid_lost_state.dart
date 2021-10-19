// ignore_for_file: prefer_const_constructors_in_immutables

part of 'kid_lost_bloc.dart';

abstract class KidLostState extends Equatable {
  const KidLostState();

  @override
  List<Object?> get props => [];
}

class KidLostInitial extends KidLostState {}

class KidLostLoading extends KidLostState {}

class KidLostLoaded extends KidLostState {
  final String description;
  final KidProfile kidProfile;
  final Location location;

  KidLostLoaded({
    required this.description,
    required this.kidProfile,
    required this.location,
  });

  @override
  List<Object?> get props => [kidProfile, location, description];
}

// class DescriptionFieldChanged extends KidLostState {
//   final String description;
//   final KidProfile kidProfile;
//   final Location location;

//   DescriptionFieldChanged({
//     required this.description,
//     required this.kidProfile,
//     required this.location,
//   });

//   @override
//   List<Object?> get props => [description, kidProfile, location];
// }

class CommentSubmitionSuccess extends KidLostState {}

class CommentSubmitionFail extends KidLostState {}

class CommentSubmiting extends KidLostState {}
