// ignore_for_file: annotate_overrides

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_that_kid/repository/LostNoticeRepository/lost_notice_repository.dart';

part 'lost_notice_detail_event.dart';
part 'lost_notice_detail_state.dart';

class LostNoticeDetailBloc
    extends Bloc<LostNoticeDetailEvent, LostNoticeDetailState> {
  final LostNoticeRepository _lostNoticeRepository;
  StreamSubscription? _lostNoticeSubscription;

  LostNoticeDetailBloc({required LostNoticeRepository lostNoticeRepository})
      : _lostNoticeRepository = LostNoticeRepository(),
        super(LostNoticeDetailInitial());

  Stream<LostNoticeDetailState> mapEventToState(
    LostNoticeDetailEvent event,
  ) async* {
    if (event is ChangeCommentField) {
      yield* _changeCommentField(event);
    }
    if (event is SubmitComment) {
      yield* _sumbitComment(event);
    }
    if (event is SubmitDelete) {
      yield* _sumbitDelete(event);
    }
  }

  Stream<LostNoticeDetailState> _changeCommentField(
      ChangeCommentField event) async* {
    yield CommentFieldChanged(comment: event.comment);
  }

  Stream<LostNoticeDetailState> _sumbitComment(SubmitComment event) async* {
    List<Map<String, dynamic>> someData = [
      {
        'username': 'sam',
        'text': event.comment,
      }
    ];
    // print(event.id);
    // print('event is : ${event}');
    _lostNoticeSubscription?.cancel();
    _lostNoticeRepository.postNewComment(comment: someData, id: event.id);
  }

  Stream<LostNoticeDetailState> _sumbitDelete(SubmitDelete event) async* {
    _lostNoticeSubscription?.cancel();
    _lostNoticeRepository.deleteLostNotice(id: event.id);
  }
}
