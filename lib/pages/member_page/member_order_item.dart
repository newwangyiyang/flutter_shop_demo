import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberOrderItem extends StatelessWidget {

  final String title;

  final IconData icon;

  const MemberOrderItem({Key key, @required this.title, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(187),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: .5, color: Colors.black12)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(24),
                color: Colors.black45
              ),
            ),
          )
        ],
        
      ),
    );
  }
}