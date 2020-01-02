import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/api/category_page.dart';
import 'package:flutter_shop/model/categorey_goods_list.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/provide/category.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:provide/provide.dart';

class BannerNav extends StatefulWidget {
  BannerNav({Key key}) : super(key: key);

  @override
  _BannerNavState createState() => _BannerNavState();
}

class _BannerNavState extends State<BannerNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(100),
      width: ScreenUtil.getInstance().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: .5,
            color: Colors.black12
          )
        )
      ),
      child: Provide<CategoryProvide>(
        builder: (context, child, category) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.bxMallSubBtoList.length,
            itemBuilder: (context, index) => _bannerItem(category.bxMallSubBtoList[index], index),
          );
        },
      ),
    );
  }

  Widget _bannerItem(BxMallSubDto item, int index) {
    return Provide<CategoryProvide>(
      builder: (context, child, category) {
        return InkWell(
          onTap: (){
            _changeBanner(index, item.mallSubId);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              '${item.mallSubName}',
              style: TextStyle(
                color: category.bannerNavIndex == index ? Colors.redAccent : Colors.black,
                fontSize: ScreenUtil.getInstance().setSp(28)
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _changeBanner(int index, String categorySubId) async {
    final ph = Provide.value<CategoryProvide>(context);

    Map data = {
      'categoryId': ph.mallCategoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    String resStr = await getMallGoods(data: data);
    List res = json.decode(resStr)['data'];
    res ??= [];
    // 更新商品列表数据
    Provide.value<CategoryGoodsListProvide>(context).changeGoodsList(res.map((item) => CategoryGoodsListDto.fromJson(item)).toList());

    ph.changeBanneNavIndex(index, categorySubId);
  }
}