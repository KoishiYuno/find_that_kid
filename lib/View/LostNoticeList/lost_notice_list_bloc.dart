// ignore_for_file: annotate_overrides

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_that_kid/Model/lost_notice.dart';
import 'package:find_that_kid/repository/LostNoticeRepository/lost_notice_repository.dart';

part 'lost_notice_list_event.dart';
part 'lost_notice_list_state.dart';

class LostNoticeListBloc
    extends Bloc<LostNoticeListEvent, LostNoticeListState> {
  final LostNoticeRepository _lostNoticeRepository;
  StreamSubscription? _lostNoticeSubscription;

  LostNoticeListBloc({required LostNoticeRepository lostNoticeRepository})
      : _lostNoticeRepository = LostNoticeRepository(),
        super(LostNoticeListLoading());

  Stream<LostNoticeListState> mapEventToState(
    LostNoticeListEvent event,
  ) async* {
    if (event is LoadLostNotices) {
      yield* _mapLoadLostNoticesToState();
    }
    if (event is UpdateLostNotices) {
      yield* _mapUpdateLostNoticesToState(event);
    }
  }

  Stream<LostNoticeListState> _mapLoadLostNoticesToState() async* {
    _lostNoticeSubscription?.cancel();
    _lostNoticeSubscription = _lostNoticeRepository
        .getAllLostNotices()
        .listen((lostNotices) => add(UpdateLostNotices(lostNotices)));
  }

  Stream<LostNoticeListState> _mapUpdateLostNoticesToState(
      UpdateLostNotices event) async* {
    yield LostNoticeListLoaded(lostNotices: event.lostNotices);
  }
}
