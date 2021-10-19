import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_that_kid/Model/location.dart';
import 'package:find_that_kid/repository/KidLocationRepository/kid_location_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final KidLocationRepository _kidLocationRepository;
  StreamSubscription? _locationSubscription;

  HomeBloc({required KidLocationRepository kidLocationRepository})
      : _kidLocationRepository = kidLocationRepository,
        super(LocationLoading());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadLocation) {
      yield* _mapLoadLocationToState();
    } else if (event is UpdateLocation) {
      yield* _mapUpdateLocationToState(event);
    }
  }

  Stream<HomeState> _mapLoadLocationToState() async* {
    _locationSubscription?.cancel();
    final location = await _kidLocationRepository.getChildLocation(id: 'myid');

    add(UpdateLocation(location: location));
  }

  Stream<HomeState> _mapUpdateLocationToState(UpdateLocation event) async* {
    yield LocationLoaded(location: event.location);
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}
