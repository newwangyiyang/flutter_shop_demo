import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationFloor1 extends StatelessWidget {
  final List<Map> navigatorList;
  const NavigationFloor1({Key key, @required this.navigatorList}) : super(key: key);

  Widget _navigatorItem(BuildContext context, Map item) {
    return InkWell(
      onTap: () {print('点击对应数据');},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            item['image'],
            fit: BoxFit.cover,
            width: ScreenUtil.getInstance().setWidth(95),
          ),
          Text(
            item['mallCategoryName'],
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(24)
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(),
        children: navigatorList.map((item)=>_navigatorItem(context, item)).toList(),
      ),
      height: ScreenUtil.getInstance().setHeight(340),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
    );
  }
}