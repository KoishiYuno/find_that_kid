// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables
import 'package:find_that_kid/View/KidProfile/kid_profile_bloc.dart';
import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidProfileView extends StatelessWidget {
  static const String routeName = '/kidProfile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => KidProfileView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Edit Kid Profile',
        leading: false,
      ),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<KidProfileBloc, KidProfileState>(
        builder: (context, state) {
          if (state is KidProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is KidProfileLoaded) {
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100.0,
                      child: Image.network(state
                          .kidProfile.avatarPath), // Your image widget here
                    ),
                    // CircleAvatar(
                    //   radius: 50,
                    //   child: Image.network(
                    //     state.kidProfile.avatarPath,
                    //   ),
                    // ),
                    TextButton(
                      onPressed: () {},
                      child: Text('change Avatar'),
                    ),
                    CustomInput(
                      title: 'Firstname',
                      maxLine: 1,
                      type: TextInputType.name,
                      content: state.kidProfile.firstname,
                    ),
                    CustomInput(
                      title: 'Lastname',
                      maxLine: 1,
                      type: TextInputType.name,
                      content: state.kidProfile.lastname,
                    ),
                    CustomInput(
                      title: 'Age',
                      maxLine: 1,
                      type: TextInputType.number,
                      content: state.kidProfile.age.toString(),
                    ),
                    CustomInput(
                      title: 'Gender',
                      maxLine: 1,
                      type: TextInputType.name,
                      content: state.kidProfile.gender,
                    ),
                    CustomInput(
                      title: 'Height (CM)',
                      maxLine: 1,
                      type: TextInputType.number,
                      content: state.kidProfile.height.toString(),
                    ),
                    CustomInput(
                      title: 'Weight (KG)',
                      maxLine: 1,
                      type: TextInputType.number,
                      content: state.kidProfile.weight.toString(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // print(KidProfile.fromSnapshot(await FirebaseFirestore
                        //     .instance
                        //     .collection('KidProfile')
                        //     .doc('myid')
                        //     .get()));
                      },
                      child: Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text('Error occour');
          }
        },
      ),
    );
  }
}
