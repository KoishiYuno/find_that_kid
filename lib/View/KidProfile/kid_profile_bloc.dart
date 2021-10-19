import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_that_kid/Model/kid_profile.dart';
import 'package:find_that_kid/repository/KidProfileRepository/kid_profile_repository.dart';

part 'kid_profile_event.dart';
part 'kid_profile_state.dart';

class KidProfileBloc extends Bloc<KidProfileEvent, KidProfileState> {
  final KidProfileRepository _kidProfileRepository;
  StreamSubscription? _kidProfileSubscription;

  KidProfileBloc({required KidProfileRepository kidProfileRepository})
      : _kidProfileRepository = kidProfileRepository,
        super(KidProfileLoading());

  @override
  Stream<KidProfileState> mapEventToState(
    KidProfileEvent event,
  ) async* {
    if (event is LoadKidProfile) {
      yield* _mapLoadKidProfileToState();
    } else if (event is UpdateKidProfile) {
      yield* _mapUpdateKidProfileToState(event);
    }
  }

  Stream<KidProfileState> _mapLoadKidProfileToState() async* {
    _kidProfileSubscription?.cancel();
    final kidProfile = await _kidProfileRepository.getKidProfile(id: 'test');

    add(UpdateKidProfile(kidProfile: kidProfile));
  }

  Stream<KidProfileState> _mapUpdateKidProfileToState(
      UpdateKidProfile event) async* {
    yield KidProfileLoaded(kidProfile: event.kidProfile);
  }

  @override
  Future<void> close() {
    _kidProfileSubscription?.cancel();
    return super.close();
  }
}
