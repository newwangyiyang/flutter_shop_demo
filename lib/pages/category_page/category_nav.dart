import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/api/category_page.dart';
import 'package:flutter_shop/model/categorey_goods_list.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/provide/category.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:provide/provide.dart';

class CategoryNav extends StatefulWidget {
  final List<CategoryDto> list;

  CategoryNav({Key key, @required this.list}) : super(key: key);

  @override
  _CategoryNavState createState() => _CategoryNavState();
}

class _CategoryNavState extends State<CategoryNav> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: .5,
            color: Colors.black12
          )
        )
      ),
       child: ListView.builder(
         itemCount: widget.list.length,
         itemBuilder: (context, index) => _navItem(context, index, widget.list[index]),
       ),
    );
  }

  Widget _navItem(BuildContext context, int index, CategoryDto item) {
    return InkWell(
      onTap: () {
        _changeNavItem(context, index, item);
      },
      child: Container(
        height: ScreenUtil.getInstance().setHeight(100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == currentIndex ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: Colors.black12
            )
          )
        ),
        child: Text(
          item.mallCategoryName
        ),
      ),
    );
  }

  void _changeNavItem(BuildContext context, int index, CategoryDto item) async{
    setState(() {
      currentIndex = index;
    });

    Map data = {
      'categoryId': item.mallCategoryId ?? '4',
      'categorySubId': '',
      'page': 1
    };
    String resStr = await getMallGoods(data: data);
    List res = json.decode(resStr)['data'];
    // 更新bannerNav
    Provide.value<CategoryProvide>(context).setBxMallSubBtoList(item.bxMallSubDto, mallCategoryId: item.mallCategoryId);
    // 更新商品列表数据
    Provide.value<CategoryGoodsListProvide>(context).changeGoodsList(res.map((item) => CategoryGoodsListDto.fromJson(item)).toList());
  }
}