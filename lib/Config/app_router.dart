// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:find_that_kid/Model/lost_notice.dart';
import 'package:find_that_kid/View/Home/home_view.dart';
import 'package:find_that_kid/View/LostNoticeDetail/lost_notice_detail_view.dart';
import 'package:find_that_kid/View/view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is routeL ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeView.route();

      // ignore: no_duplicate_case_values
      case HomeView.routeName:
        return HomeView.route();

      case KidProfileView.routeName:
        return KidProfileView.route();

      case KidLostView.routeName:
        return KidLostView.route();

      case LostNoticeListView.routeName:
        return LostNoticeListView.route();

      case MenuView.routeName:
        return MenuView.route();

      case LostNoticeDetail.routeName:
        return LostNoticeDetail.route(
            lostNotice: settings.arguments as LostNotice);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
