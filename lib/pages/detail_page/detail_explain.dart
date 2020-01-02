import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailExplain extends StatelessWidget {
  const DetailExplain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil.getInstance().setWidth(750),
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Text(
        '说明：> 急速送达 > 正品保证',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: ScreenUtil.getInstance().setSp(26)
        ),
      ),
    );
  }
}