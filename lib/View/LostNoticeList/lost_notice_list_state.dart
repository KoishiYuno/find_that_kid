// ignore_for_file: prefer_const_constructors_in_immutables

part of './lost_notice_list_bloc.dart';

abstract class LostNoticeListState extends Equatable {
  const LostNoticeListState();

  @override
  List<Object> get props => [];
}

class LostNoticeListLoading extends LostNoticeListState {}

class LostNoticeListLoaded extends LostNoticeListState {
  final List<LostNotice> lostNotices;

  LostNoticeListLoaded({
    this.lostNotices = const <LostNotice>[],
  });

  @override
  List<Object> get props => [lostNotices];
}
