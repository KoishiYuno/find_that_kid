// ignore_for_file: prefer_const_constructors_in_immutables

part of 'kid_lost_bloc.dart';

abstract class KidLostEvent extends Equatable {
  const KidLostEvent();

  @override
  List<Object?> get props => [];
}

class LoadKidLost extends KidLostEvent {}

class UpdateKidLost extends KidLostEvent {
  final String description;
  final KidProfile kidProfile;
  final Location location;

  UpdateKidLost({
    required this.description,
    required this.kidProfile,
    required this.location,
  });
  @override
  List<Object?> get props => [kidProfile, location, description];
}

class ChangeDescriptionField extends KidLostEvent {
  final String description;
  final KidProfile kidProfile;
  final Location location;

  ChangeDescriptionField(
    this.description,
    this.kidProfile,
    this.location,
  );

  @override
  List<Object?> get props => [description, kidProfile, location];
}

class SubmitDescription extends KidLostEvent {
  final KidProfile kidProfile;
  final Location location;
  final String description;
  final String id;

  SubmitDescription({
    required this.description,
    required this.id,
    required this.kidProfile,
    required this.location,
  });
}
