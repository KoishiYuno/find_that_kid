// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_that_kid/Config/app_router.dart';
import 'package:find_that_kid/Config/theme.dart';
import 'package:find_that_kid/View/Home/home_bloc.dart';
import 'package:find_that_kid/View/KidLost/kid_lost_bloc.dart';
import 'package:find_that_kid/View/KidProfile/kid_profile_bloc.dart';
import 'package:find_that_kid/View/LostNoticeDetail/lost_notice_detail_bloc.dart';
import 'package:find_that_kid/View/LostNoticeList/lost_notice_list_bloc.dart';
import 'package:find_that_kid/repository/KidLocationRepository/kid_location_repository.dart';
import 'package:find_that_kid/repository/KidProfileRepository/kid_profile_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'View/view.dart';
import 'repository/LostNoticeRepository/lost_notice_repository.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<KidLocationRepository>(
            create: (_) => KidLocationRepository()),
        RepositoryProvider<LostNoticeRepository>(
            create: (_) => LostNoticeRepository()),
        RepositoryProvider<KidProfileRepository>(
            create: (_) => KidProfileRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomeBloc(
                  kidLocationRepository: context.read<KidLocationRepository>())
                ..add(LoadLocation())),
          BlocProvider(
            create: (_) =>
                LostNoticeListBloc(lostNoticeRepository: LostNoticeRepository())
                  ..add(LoadLostNotices()),
          ),
          BlocProvider(
            create: (_) => LostNoticeDetailBloc(
                lostNoticeRepository: LostNoticeRepository()),
          ),
          BlocProvider(
            create: (_) =>
                KidProfileBloc(kidProfileRepository: KidProfileRepository())
                  ..add(LoadKidProfile()),
          ),
          BlocProvider(
            create: (_) => KidLostBloc(
              kidLocationRepository: KidLocationRepository(),
              kidProfileRepository: KidProfileRepository(),
              lostNoticeRepository: LostNoticeRepository(),
            )..add(LoadKidLost()),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeView.routeName,
            home: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('something went wrong');
                } else if (snapshot.hasData) {
                  return HomeView();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}
