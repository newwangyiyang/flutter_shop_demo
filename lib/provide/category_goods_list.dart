import 'package:flutter/material.dart';
import 'package:flutter_shop/model/categorey_goods_list.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsListDto> goodsList = [];

  void changeGoodsList(List<CategoryGoodsListDto> list) {
    goodsList = list;
    notifyListeners();
  }
}