import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/car_info.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  final CarInfoDto carInfoDto;

  const CartCount({Key key, @required this.carInfoDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(165),
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: Colors.black12)
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context, carInfoDto),
          _countWrap(carInfoDto),
          _addBtn(context, carInfoDto)
        ],
      ),
    );
  }

  Widget _reduceBtn(BuildContext context, CarInfoDto item) {
    return InkWell(
      onTap: () {
        if(item.count > 1) {
          _reduceGoodsCount(context, item.goodsId);
        }
      },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(45),
        width: ScreenUtil.getInstance().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count == 1 ? Colors.black12 : Colors.white,
          border: Border(
            right: BorderSide(width: .5, color: Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }

  Widget _addBtn(BuildContext context, CarInfoDto item) {
    return InkWell(
      onTap: () {
        _addGoodsCount(context, item.goodsId);
      },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(45),
        width: ScreenUtil.getInstance().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: .5, color: Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }

  Widget _countWrap(CarInfoDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(60),
      height: ScreenUtil.getInstance().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }

  void _addGoodsCount(BuildContext context, String goodsId) {
    final ph = Provide.value<CarInfoProvide>(context);

    ph.updateGoodsCount(goodsId, isAdd: true);
  }

  void _reduceGoodsCount(BuildContext context, String goodsId) {
    final ph = Provide.value<CarInfoProvide>(context);

    ph.updateGoodsCount(goodsId);
  }
}