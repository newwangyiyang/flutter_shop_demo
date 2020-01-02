import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';

class Recommend extends StatelessWidget {
  final List recommendList;
  const Recommend({Key key, @required this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(410),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _recommendTitle(),
          _recommendList(recommendList)
        ],
      ),
    );
  }

  Widget _recommendTitle() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(60),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink
        ),
      ),
    );
  }

  Widget _recommendItem(BuildContext context, Map item) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, 'detailPage/${item['goodsId']}');
      },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(350),
        width: ScreenUtil.getInstance().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: .5, color: Colors.black12
            )
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(item['image']),
            Text('￥${item['mallPrice']}'),
            Text(
              '￥${item['price']}',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList(List recommendList) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(350),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _recommendItem(context, recommendList[index]);
        },
      ),
    );
  }
}