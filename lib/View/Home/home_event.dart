// ignore_for_file: prefer_const_constructors_in_immutables

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadLocation extends HomeEvent {}

class UpdateLocation extends HomeEvent {
  final Location location;

  UpdateLocation({required this.location});
  @override
  List<Object?> get props => [location];
}
