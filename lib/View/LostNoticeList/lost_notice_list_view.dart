// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:find_that_kid/View/LostNoticeList/lost_notice_list_bloc.dart';
import 'package:flutter/material.dart';

import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LostNoticeListView extends StatelessWidget {
  static const String routeName = '/lostNoticeList';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => LostNoticeListView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: 'Lost Notices',
          leading: false,
        ),
        bottomNavigationBar: CustomNavBar(),
        body: BlocBuilder<LostNoticeListBloc, LostNoticeListState>(
          builder: (context, state) {
            if (state is LostNoticeListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LostNoticeListLoaded) {
              return ListView.builder(
                itemCount: state.lostNotices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: LostNoticeItem(
                      lostNotice: state.lostNotices[index],
                    ),
                  );
                },
              );
            } else {
              return Text("Something went wrong");
            }
          },
        ));
  }
}
