part of 'kid_profile_bloc.dart';

abstract class KidProfileEvent extends Equatable {
  const KidProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadKidProfile extends KidProfileEvent {}

class UpdateKidProfile extends KidProfileEvent {
  final KidProfile kidProfile;

  UpdateKidProfile({required this.kidProfile});

  @override
  List<Object> get props => [kidProfile];
}
