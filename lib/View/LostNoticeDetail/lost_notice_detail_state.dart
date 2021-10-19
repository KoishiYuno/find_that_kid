// ignore_for_file: prefer_const_constructors_in_immutables

part of './lost_notice_detail_bloc.dart';

abstract class LostNoticeDetailState extends Equatable {
  const LostNoticeDetailState();

  @override
  List<Object> get props => [];
}

class LostNoticeDetailInitial extends LostNoticeDetailState {}

class CommentFieldChanged extends LostNoticeDetailState {
  final String comment;

  CommentFieldChanged({
    required this.comment,
  });

  @override
  List<Object> get props => [comment];
}

// class LostNoticeListLoaded extends LostNoticeListState {
//   final List<LostNotice> lostNotices;

//   LostNoticeListLoaded({
//     this.lostNotices = const <LostNotice>[],
//   });

//   @override
//   List<Object> get props => [lostNotices];
// }

class CommentSubmitionSuccess extends LostNoticeDetailState {}

class CommentSubmitionFail extends LostNoticeDetailState {}

class CommentSubmiting extends LostNoticeDetailState {}
