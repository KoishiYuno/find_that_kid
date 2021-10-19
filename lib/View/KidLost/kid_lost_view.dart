// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:find_that_kid/View/KidLost/kid_lost_bloc.dart';
import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class KidLostView extends StatelessWidget {
  static const String routeName = '/kidLost';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => KidLostView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Lost Notices'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<KidLostBloc, KidLostState>(
        builder: (context, state) {
          if (state is KidLostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is KidLostLoaded) {
            return ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 150.0,
                            child: Image.network(state.kidProfile
                                .avatarPath), // Your image widget here
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text_two_column(
                          text:
                              'My kid ${state.kidProfile.firstname} ${state.kidProfile.lastname}, ${state.kidProfile.age} years old, ${state.kidProfile.height}cm and around ${state.kidProfile.weight}kg lost at ${state.location.place} at ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(state.location.date))}',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        text_two_column(
                          text: 'My Name: Van LightHolme',
                        ),
                        text_two_column(
                            text: 'My Email: vanlightholme@gmail.com'),
                        text_two_column(text: 'My Phone: 1234567890'),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, bottom: 10, right: 10, top: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        'Please check the above information and photo is correct for your child and provide any further details about your child if possible include dressing on losing day, school, and other distinctive characteristics. Please ensure that you have filled in the correct information, as incorrect information may mislead other users who are helping you',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.justify),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Provide More Detail About Your Kid: ',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.left),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
                  height: 12 * 16.0,
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 12,
                    decoration: InputDecoration(
                      hintText:
                          "Provide More detail about your kid, for example, dressing on the losing day, school,  and other distinctive characteristics.",
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) =>
                        context.read<KidLostBloc>().add(UpdateKidLost(
                              kidProfile: state.kidProfile,
                              location: state.location,
                              description: value,
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<KidLostBloc>().add(SubmitDescription(
                            description: state.description,
                            id: 'test',
                            kidProfile: state.kidProfile,
                            location: state.location,
                          ));
                      Navigator.pushNamed(context, '/lostNoticeList');
                      // print(state.description);
                    },
                    child: Text('Post Lost Notice'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          } else {
            return Text('Error occour');
          }
        },
      ),
    );
  }
}
