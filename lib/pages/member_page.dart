import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/member_page/member_header.dart';
import 'package:flutter_shop/pages/member_page/member_order_item.dart';
import 'package:flutter_shop/pages/member_page/member_tile_item.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:provide/provide.dart';

class MemberPage extends StatelessWidget {


  const MemberPage({Key key}) : super(key: key);

  static List _memberList = [
    {
      'title': '领取优惠券',
      'icon': Icon(Icons.accessible)
    },
    {
      'title': '已领取优惠券',
      'icon': Icon(Icons.account_box)
    },
    {
      'title': '地址管理',
      'icon': Icon(Icons.account_circle)
    },
    {
      'title': '客服电话',
      'icon': Icon(Icons.adjust)
    },
  ];

  static List _memberOrderList = [
    {
      'title': '代付款',
      'icon': Icons.adjust
    },
    {
      'title': '代发货',
      'icon': Icons.work
    },
    {
      'title': '代收货',
      'icon': Icons.whatshot
    },
    {
      'title': '代评价',
      'icon': Icons.watch
    },
  ];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          MemberHeader(),
          MemberTileItem(title: '我的订单', icon: Icon(Icons.money_off)),
          Row(
            children: _memberOrderList.map((item) => MemberOrderItem(title: item['title'], icon: item['icon'])).toList(),
          ),

          Container(
            color: Colors.black12,
            height: 10,
          ),
          Column(
            children: _memberList.map((item) => MemberTileItem(title: item['title'], icon: item['icon'],)).toList(),
          )
        ],
      ),
    );
  }
}

