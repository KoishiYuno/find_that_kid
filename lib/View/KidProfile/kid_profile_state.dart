// ignore_for_file: prefer_const_constructors_in_immutables

part of 'kid_profile_bloc.dart';

abstract class KidProfileState extends Equatable {
  const KidProfileState();

  @override
  List<Object?> get props => [];
}

class KidProfileInitial extends KidProfileState {}

class KidProfileLoading extends KidProfileState {}

class KidProfileLoaded extends KidProfileState {
  final KidProfile kidProfile;

  KidProfileLoaded({required this.kidProfile});

  @override
  List<Object?> get props => [kidProfile];
}

class KidProfileError extends KidProfileState {}
