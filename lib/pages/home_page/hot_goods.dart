import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';

class HotGoods extends StatefulWidget {
  final List<Map> hotGoodsList;
  HotGoods({Key key, @required this.hotGoodsList}) : super(key: key);

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _hotList()
        ],
      ),
    );
  }

  // void getHotGoodsListData() async {
  //   String resStr = await getHomePageBelowConten(pageNum);
  //   Map data = json.decode(resStr);
  //   List<Map> tempList = (data['data'] as List).cast();
  //   setState(() {
  //     hotGoodsList.addAll(tempList);
  //     pageNum++;
  //   });
  // }

  Widget _hotTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: ScreenUtil.getInstance().setHeight(60),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.black12)
        )
      ),
      child: Text(
        '火爆专区',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _hotItem(Map item) {
    return InkWell(
      onTap: () {
        print(item['goodsId']);
        Application.router.navigateTo(context, '/detailPage/${item['goodsId']}');
      },
      child: Container(
        width: ScreenUtil.getInstance().setWidth(375),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: .5, color: Colors.black12),
            bottom: BorderSide(width: .5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(item['image']),
            Text(
              item['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: ScreenUtil.getInstance().setSp(24)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '￥${item['mallPrice']}',
                ),
                Text(
                  '￥${item['price']}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black12
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _hotList() {
    return Wrap(
      children: widget.hotGoodsList.map((item) => _hotItem(item)).toList()
    );
  }
}