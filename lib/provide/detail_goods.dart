import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/api/detail_goods.dart';
import 'package:flutter_shop/model/detail_goods.dart';

class DateilGoodsProvide with ChangeNotifier {
  DetailGoodsDto detailGoodsDto;

  Future setDetailGoodsDto(String goodId) async {
    String resStr = await getGoodsDetailInfo(goodId);
    Map res = json.decode(resStr)['data'];
    detailGoodsDto = DetailGoodsDto.fromJson(res);
    notifyListeners();
  }
}