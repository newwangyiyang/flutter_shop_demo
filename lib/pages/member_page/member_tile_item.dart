import 'package:flutter/material.dart';

class MemberTileItem extends StatelessWidget {

  final String title;

  final Icon icon;

  const MemberTileItem({Key key, @required this.title, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .5, color: Colors.black12)
          )
        ),
        child: ListTile(
          leading: icon,
          title: Text(title),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}