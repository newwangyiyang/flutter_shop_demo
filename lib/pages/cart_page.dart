import 'package:flutter/material.dart';
import 'package:flutter_shop/model/car_info.dart';
import 'package:flutter_shop/pages/cart_page/cart_bottom_bar.dart';
import 'package:flutter_shop/pages/cart_page/cart_item.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCarInfo(context),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Provide<CarInfoProvide>(
              builder: (context, child, cip) {
                List<CarInfoDto> carList = cip.carList;
                return Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: carList.length,
                      itemBuilder: (context, index) {
                        return CartItem(carInfoDto: carList[index]);
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: CartBottomBar(),
                    )
                  ],
                );
              },
            );
          } else {
            return Container(
              child: Center(
                child: Text('数据加载中...'),
              ),
            );
          }
        },
      ),
    );
  }

  Future _getCarInfo(BuildContext context) async{
    final ph = Provide.value<CarInfoProvide>(context);
    await ph.getCarList();
    return '';
  }
}