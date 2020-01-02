import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/detail_goods.dart';
import 'package:provide/provide.dart';

class DetailInfoWeb extends StatelessWidget {
  const DetailInfoWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DateilGoodsProvide>(
      builder: (context, child, dgp) {
        return Container(
          child: Html(
            data: dgp.detailGoodsDto.goodInfo.goodsDetail,
          ),
        );
      },
    );
  }
}