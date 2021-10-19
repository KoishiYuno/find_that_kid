// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:find_that_kid/View/Home/home_bloc.dart';
import 'package:find_that_kid/Widget/custom_map.dart';
import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Location Tracker'),
      bottomNavigationBar: CustomNavBar(),
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LocationLoaded) {
                return CustomGoogleMapWidget(
                  date: state.location.date,
                  lat: state.location.lat,
                  lng: state.location.lng,
                );
              } else {
                return Text('Error occour');
              }
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LocationLoaded) {
                if (state.location.date + 1200000 <
                    DateTime.now().millisecondsSinceEpoch) {
                  return Positioned(
                    bottom: 55,
                    left: 20,
                    right: 20,
                    child: customWarningText(
                      text: 'Cannot Get Location From Your Kid',
                      background_color: Colors.white,
                      text_color: Colors.red,
                    ),
                  );
                }
                return SizedBox.shrink();
              } else {
                return Text('Error occour');
              }
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LocationLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LocationLoaded) {
                // print(state.location.date -
                //     DateTime.now().millisecondsSinceEpoch);
                if (state.location.state == 'sos') {
                  return Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: customWarningText(
                      text: 'Your Kid Pressed SOS Button',
                      background_color: Colors.red,
                      text_color: Colors.white,
                    ),
                  );
                }
                return SizedBox.shrink();
              } else {
                return Text('Error occour');
              }
            },
          ),
        ],
      ),
    );
  }
}
