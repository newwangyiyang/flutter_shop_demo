import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:provide/provide.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750),
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          _selectAllBtn(context),
          _allPriceWrap(context),
          _buyButton(context)
        ],
      ),
    );
  }

  Widget _selectAllBtn(BuildContext context) {
    return Provide<CarInfoProvide>(
      builder: (context, child, cip) {
        return Container(
          child: Row(
            children: <Widget>[
              Checkbox(
                value: cip.isAllCheck,
                activeColor: Colors.redAccent,
                onChanged: (bool val) {
                  _selectAllGoods(context, val);
                },
              ),
              Text(
                '全选',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(24),
                  color: Colors.black45
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _allPriceWrap(BuildContext context) {
    return Provide<CarInfoProvide>(
      builder: (context, child, cip) {
        return Container(
                  width: ScreenUtil.getInstance().setWidth(430),
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            width: ScreenUtil.getInstance().setWidth(300),
                            child: Text(
                              '合计',
                              style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(28),
                                color: Colors.black45
                              )
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '￥ ${cip.goodsAllPrice}',
                              style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(26),
                                color: Colors.redAccent
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '满10元免配送费，预购免配送费',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(24),
                            color: Colors.black45
                          ),
                        ),
                      )
                    ],
                  ),
                );
      },
    );
  }

  Widget _buyButton(BuildContext context) {
    return Provide<CarInfoProvide>(
      builder: (context, child, cip) {
        return Container(
          width: ScreenUtil.getInstance().setWidth(160),
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: (){},
            child: Container(
              height: ScreenUtil.getInstance().setHeight(80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text(
                '结算(${cip.goodsNum})',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26),
                  color: Colors.white
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectAllGoods(BuildContext context, bool isAllCheck) {
    final ph = Provide.value<CarInfoProvide>(context);

    ph.updateAllSelectedChecked(isAllCheck);
  }
}