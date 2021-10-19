// ignore_for_file: prefer_const_constructors_in_immutables

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class LocationLoading extends HomeState {}

class LocationLoaded extends HomeState {
  final Location location;

  LocationLoaded({required this.location});

  @override
  List<Object?> get props => [location];
}

class LocationError extends HomeState {}
