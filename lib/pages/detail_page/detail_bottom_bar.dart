import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/car_info.dart';
import 'package:flutter_shop/model/detail_goods.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:flutter_shop/provide/detail_goods.dart';
import 'package:provide/provide.dart';

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      height: ScreenUtil.getInstance().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              InkWell(
                onTap: (){
                  _goCartPage(context);
                },
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(110),
                  height: ScreenUtil.getInstance().setHeight(80),
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_cart, color: Colors.redAccent),
                ),
              ),
              Provide<CarInfoProvide>(
                builder: (context, child, cip) {
                  return cip.goodsNum > 0 ? 
                  Positioned(
                    top: -10,
                    right: 0,
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(40),
                      width: ScreenUtil.getInstance().setWidth(50),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${cip.goodsNum}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(28),
                          color: Colors.white,
                          
                        ),
                      ),
                    ),
                  ) :
                  Container();
                },
              )
            ],
          ),
          InkWell(
            onTap: (){
              _addCar(context);
            },
            child: Container(
              width: ScreenUtil.getInstance().setWidth(320),
              height: ScreenUtil.getInstance().setHeight(80),
              color: Colors.green[300],
              alignment: Alignment.center,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(28)
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                _immediateBuy(context);
              },
              child: Container(
                color: Colors.red[300],
                height: ScreenUtil.getInstance().setHeight(80),
                alignment: Alignment.center,
                child: Text(
                  '马上购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(28)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addCar(BuildContext context) {
    GoodInfo goodInfo = Provide.value<DateilGoodsProvide>(context).detailGoodsDto.goodInfo;
    final phCar = Provide.value<CarInfoProvide>(context);
    Map<String, dynamic> goods = {
      'goodsId': goodInfo.goodsId,
      'goodsName': goodInfo.goodsName,
      'count': 1,
      'price': goodInfo.presentPrice,
      'images': goodInfo.image1,
      'isCheck': true,
    };

    phCar.updateCarList(CarInfoDto.fromJson(goods));
  }

  void _goCartPage(BuildContext context) {
    final ph = Provide.value<CurrentIndexProvide>(context);
    ph.updateCurrentIndex(2);

    Navigator.pop(context);
  }

  void _immediateBuy(BuildContext context) {
    final phCar = Provide.value<CarInfoProvide>(context);
    phCar.clearCarList();
  }
}