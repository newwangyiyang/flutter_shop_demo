import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/detail_page/detail_bottom_bar.dart';
import 'package:flutter_shop/pages/detail_page/detail_explain.dart';
import 'package:flutter_shop/pages/detail_page/detail_tab.dart';
import 'package:flutter_shop/pages/detail_page/detail_top_info.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/detail_goods.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage({Key key, @required this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Provide<DateilGoodsProvide>(builder: (context, child, dgp) => Text(dgp.detailGoodsDto.goodInfo.goodsName)),
        ),
        body: FutureBuilder(
          future: _getDetailGoods(context, goodsId),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      DetailTopInfo(),
                      DetailExplain(),
                      DetailTab(),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: DetailBottomBar(),
                  )
                ],
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

  Future _getDetailGoods(BuildContext context, String goodId) async {
    final ph = Provide.value<DateilGoodsProvide>(context);
    await ph.setDetailGoodsDto(goodId);
    return '';
  }
}