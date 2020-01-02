import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberHeader extends StatelessWidget {
  const MemberHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      height: ScreenUtil.getInstance().setHeight(400),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577880351962&di=45a83e33001fd3338771685b82738a32&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2019-01-05%2F5c305da63fc78.jpg')
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'http://blogimages.jspang.com/blogtouxiang1.jpg',
              height: ScreenUtil.getInstance().setHeight(200),
              width: ScreenUtil.getInstance().setWidth(200),
            ),
          ),
          Container(height: ScreenUtil.getInstance().setHeight(60),),
          Text(
            '技术胖',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30),
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}