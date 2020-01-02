import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/detail_goods.dart';
import 'package:flutter_shop/provide/detail_goods.dart';
import 'package:provide/provide.dart';

class DetailTopInfo extends StatelessWidget {
  const DetailTopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DateilGoodsProvide>(
      builder: (context, child, dgp) {
        GoodInfo goodInfo = dgp.detailGoodsDto.goodInfo;
        return Column(
          children: <Widget>[
            _topImage(goodInfo.image1),
            _topTitle(goodInfo.goodsName),
            _topCode(goodInfo.goodsSerialNumber),
            _topPrice(goodInfo.oriPrice, goodInfo.presentPrice)
          ],
        );
      },
    );
  }

  Widget _topImage(String url) {
    return Container(
      alignment: Alignment.center,
      child: Image.network(
        url, 
        fit: BoxFit.cover,
        width: ScreenUtil.getInstance().setWidth(740),
      ),
    );
  }

  Widget _topTitle(String title) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      padding: EdgeInsets.only(left: 20),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(30),
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _topCode(String code) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      height: ScreenUtil.getInstance().setHeight(60),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      child: Text(
        '编号: $code',
        style: TextStyle(
          color: Colors.black26,
          fontSize: ScreenUtil.getInstance().setSp(26)
        ),
      ),
    );
  }

  Widget _topPrice(double oldPrice, double price) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(730),
      padding: EdgeInsets.only(left: 20),
      height: ScreenUtil.getInstance().setHeight(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '￥: $price',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: ScreenUtil.getInstance().setSp(30),
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(30),
          ),
          Text(
            '市场价: ￥: $oldPrice',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.black26,
              fontSize: ScreenUtil.getInstance().setSp(24)
            ),
          )
        ],
      ),
    );
  }
}