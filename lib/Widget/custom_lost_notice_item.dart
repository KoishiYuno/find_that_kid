import 'package:find_that_kid/Model/lost_notice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LostNoticeItem extends StatelessWidget {
  final LostNotice lostNotice;
  const LostNoticeItem({
    Key? key,
    required this.lostNotice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/lostNoticeDetail',
            arguments: lostNotice);
      },
      child: ListTile(
        leading: Image.network(lostNotice
            .avatarPath), // no matter how big it is, it won't overflow

        title: Text(
            '${lostNotice.firstname} ${lostNotice.lastname} ${lostNotice.age} years old lost at ${lostNotice.place} at ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(lostNotice.time))}'),
      ),
    );
  }
}
