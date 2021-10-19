// ignore_for_file: prefer_const_constructors_in_immutables

part of './lost_notice_detail_bloc.dart';

abstract class LostNoticeDetailEvent extends Equatable {
  const LostNoticeDetailEvent();

  @override
  List<Object> get props => [];
}

class ChangeCommentField extends LostNoticeDetailEvent {
  final String comment;

  ChangeCommentField(this.comment);

  @override
  List<Object> get props => [comment];
}

class SubmitComment extends LostNoticeDetailEvent {
  final String comment;
  final String id;

  SubmitComment(this.comment, this.id);

  @override
  List<Object> get props => [comment];
}
