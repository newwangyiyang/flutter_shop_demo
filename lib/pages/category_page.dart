import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/api/category_page.dart';
import 'package:flutter_shop/model/categorey_goods_list.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/pages/category_page/banner_nav.dart';
import 'package:flutter_shop/pages/category_page/category_goods_list.dart';
import 'package:flutter_shop/pages/category_page/category_nav.dart';
import 'package:flutter_shop/provide/category.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:provide/provide.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<CategoryDto> categoryList = [];

  @override
  void initState() {
    _getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            CategoryNav(list: categoryList),
            Column(
              children: <Widget>[
                BannerNav(),
                CategoryGoodsList()
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _getCategoryList() async {
    String resStr = await getCategory();
    List res = json.decode(resStr)['data'];
    setState(() {
      categoryList = res.map((item) => CategoryDto.fromJson(item)).toList();
    });
    Provide.value<CategoryProvide>(context).setBxMallSubBtoList(categoryList[0].bxMallSubDto, mallCategoryId: categoryList[0].mallCategoryId);

    Map data = {
      'categoryId': '4',
      'categorySubId': '',
      'page': 1
    };
    String resStrList = await getMallGoods(data: data);
    List resList = json.decode(resStrList)['data'];
    Provide.value<CategoryGoodsListProvide>(context).changeGoodsList(resList.map((item) => CategoryGoodsListDto.fromJson(item)).toList());
  }
}