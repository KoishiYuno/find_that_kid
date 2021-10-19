// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_that_kid/Model/kid_profile.dart';
import 'package:find_that_kid/Model/location.dart';
import 'package:find_that_kid/repository/KidLocationRepository/kid_location_repository.dart';
import 'package:find_that_kid/repository/KidProfileRepository/kid_profile_repository.dart';
import 'package:find_that_kid/repository/LostNoticeRepository/lost_notice_repository.dart';

part 'kid_lost_event.dart';
part 'kid_lost_state.dart';

class KidLostBloc extends Bloc<KidLostEvent, KidLostState> {
  final LostNoticeRepository _lostNoticeRepository;
  final KidProfileRepository _kidProfileRepository;
  final KidLocationRepository _kidLocationRepository;
  StreamSubscription? _kidLostSubscription;

  KidLostBloc({
    required KidProfileRepository kidProfileRepository,
    required KidLocationRepository kidLocationRepository,
    required LostNoticeRepository lostNoticeRepository,
  })  : _kidProfileRepository = kidProfileRepository,
        _kidLocationRepository = kidLocationRepository,
        _lostNoticeRepository = lostNoticeRepository,
        super(KidLostLoading());

  @override
  Stream<KidLostState> mapEventToState(
    KidLostEvent event,
  ) async* {
    if (event is LoadKidLost) {
      yield* _mapLoadKidLostToState();
    } else if (event is UpdateKidLost) {
      yield* _mapUpdateKidLostToState(event);
    }
    // else if (event is ChangeDescriptionField) {
    //   yield* _changeDescriptionField(event);
    // }
    else if (event is SubmitDescription) {
      yield* _submitDescription(event);
    }
  }

  Stream<KidLostState> _mapLoadKidLostToState() async* {
    _kidLostSubscription?.cancel();
    final kidProfile = await _kidProfileRepository.getKidProfile(id: 'test');
    final location = await _kidLocationRepository.getChildLocation(id: 'myid');

    add(UpdateKidLost(
        kidProfile: kidProfile, location: location, description: ''));
  }

  Stream<KidLostState> _mapUpdateKidLostToState(UpdateKidLost event) async* {
    yield KidLostLoaded(
      kidProfile: event.kidProfile,
      location: event.location,
      description: event.description,
    );
  }

  // Stream<KidLostState> _changeDescriptionField(
  //     ChangeDescriptionField event) async* {
  //   yield DescriptionFieldChanged(
  //       description: event.description,
  //       kidProfile: event.kidProfile,
  //       location: event.location);
  // }

  Stream<KidLostState> _submitDescription(SubmitDescription event) async* {
    _kidLostSubscription?.cancel();
    _lostNoticeRepository.createLostNotice(
      id: event.id,
      description: event.description,
      location: event.location,
      kidProfile: event.kidProfile,
    );
  }

  @override
  Future<void> close() {
    _kidLostSubscription?.cancel();
    return super.close();
  }
}
