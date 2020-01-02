import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final Map shopInfo;
  const LeaderPhone({Key key, @required this.shopInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callLeaderPhone,
      child: Container(
        child: Image.network(
          shopInfo['leaderImage']
        ),
      ),
    );
  }

  void _callLeaderPhone() async {
    final url = 'tel:${shopInfo['leaderPhone']}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}