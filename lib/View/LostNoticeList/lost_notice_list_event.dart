// ignore_for_file: prefer_const_constructors_in_immutables

part of './lost_notice_list_bloc.dart';

abstract class LostNoticeListEvent extends Equatable {
  const LostNoticeListEvent();

  @override
  List<Object> get props => [];
}

class LoadLostNotices extends LostNoticeListEvent {}

class UpdateLostNotices extends LostNoticeListEvent {
  final List<LostNotice> lostNotices;

  UpdateLostNotices(this.lostNotices);

  @override
  List<Object> get props => [lostNotices];
}
