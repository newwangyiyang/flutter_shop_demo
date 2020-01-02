import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/car_info.dart';
import 'package:flutter_shop/pages/cart_page/cart_count.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:provide/provide.dart';

class CartItem extends StatelessWidget {
  final CarInfoDto carInfoDto;

  const CartItem({Key key, @required this.carInfoDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBox(context, carInfoDto),
          _cartImage(carInfoDto),
          _cartTitle(carInfoDto),
          _cartPrice(context, carInfoDto)
        ],
      ),
    );
  }

  Widget _cartCheckBox(BuildContext context, CarInfoDto item) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.redAccent,
        onChanged: (bool val) {
          _goodscheckChange(context, item);
        },
      ),
    );
  }

  Widget _cartImage(CarInfoDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(150),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: Colors.black12)
      ),
      child: Image.network(item.images),
    );
  }

  Widget _cartTitle(CarInfoDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(300),
      height: ScreenUtil.getInstance().setHeight(150),
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              item.goodsName, 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(26), 
                fontWeight: FontWeight.bold
              ),
          ),
          CartCount(carInfoDto: carInfoDto)
        ],
      ),
    );
  }

  Widget _cartPrice(BuildContext context, CarInfoDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(150),
      height: ScreenUtil.getInstance().setHeight(150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '￥: ${item.price}',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(26)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: (){
                _deleteCarGoods(context, item);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _deleteCarGoods(BuildContext context, CarInfoDto item) {
    final ph = Provide.value<CarInfoProvide>(context);
    ph.deleteCarList(item.goodsId);
  }

  void _goodscheckChange(BuildContext context, CarInfoDto item) {
    final ph = Provide.value<CarInfoProvide>(context);
    ph.updateGoodsChecked(item.goodsId);
  }
}