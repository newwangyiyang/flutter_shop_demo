import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';

class FloorGoods extends StatelessWidget {
   final Map floorGoods;

  const FloorGoods({Key key, @required this.floorGoods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          _floorTitle(floorGoods['floorPic']['PICTURE_ADDRESS']),
          _floorTopGoods(context),
          _floorBottomGoods(context)
        ],
      ),
    );
  }

  Widget _floorTitle(String titleImg) {
    return Container(
      child: Image.network(titleImg),
    );
  }

  Widget _goodsItem(BuildContext context, Map item) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detailPage/${item['goodsId']}');
      },
      child: Container(
        width: ScreenUtil.getInstance().setWidth(375),
        child: Image.network(item['image']),
      ),
    );
  }

  Widget _floorTopGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoods['floor'][0]),
        Column(
          children: <Widget>[
            _goodsItem(context, floorGoods['floor'][1]),
            _goodsItem(context, floorGoods['floor'][2])
          ],
        )
      ],
    );
  }

  Widget _floorBottomGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoods['floor'][3]),
        _goodsItem(context, floorGoods['floor'][4]),
      ],
    );
  }
}