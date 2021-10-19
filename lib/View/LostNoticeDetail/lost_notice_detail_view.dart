// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find_that_kid/Model/lost_notice.dart';
import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'lost_notice_detail_bloc.dart';

class LostNoticeDetail extends StatelessWidget {
  static const String routeName = '/lostNoticeDetail';

  static Route route({required LostNotice lostNotice}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LostNoticeDetail(lostNotice: lostNotice),
    );
  }

  final LostNotice lostNotice;

  const LostNoticeDetail({required this.lostNotice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: 'Lost Notice: ${lostNotice.firstname}'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<LostNoticeDetailBloc, LostNoticeDetailState>(
          builder: (context, state) {
        return ListView(
          children: [
            SizedBox(
              height: 15,
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
                        child: Image.network(
                            lostNotice.avatarPath), // Your image widget here
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text_two_column(
                      text:
                          'My kid ${lostNotice.firstname} ${lostNotice.lastname}, ${lostNotice.age} years old, ${lostNotice.height}cm and around ${lostNotice.weight}kg lost at ${lostNotice.place} at ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(lostNotice.time))}',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    text_two_column(
                      text: 'My Name: ${lostNotice.parentName}',
                    ),
                    text_two_column(text: 'My Email: ${lostNotice.email}'),
                    text_two_column(text: 'My Phone: ${lostNotice.phone}'),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 10, right: 10, top: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('Some Further Information: ',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.left),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(lostNotice.description,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                    'Please provide any clues if you have by leaving comments below. Thank you very much',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('Comments: ',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.left),
              ),
            ),
            // Expanded(child:
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: lostNotice.comment.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                          '${lostNotice.comment[index].username}: ${lostNotice.comment[index].text}',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.left),
                    ),
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 6 * 18.0,
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 6,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  hintText: "Provide Clues By Leave a Comment",
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
                onChanged: (value) => context.read<LostNoticeDetailBloc>().add(
                      ChangeCommentField(value),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<LostNoticeDetailBloc>()
                      .add(SubmitComment(state.props.join(""), lostNotice.id));
                  Navigator.pushNamed(context, '/lostNoticeList');
                  // print(state.props.join(""));
                },
                child: Text('Post Comment'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}
