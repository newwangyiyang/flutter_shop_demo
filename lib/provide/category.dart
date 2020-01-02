import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

class CategoryProvide with ChangeNotifier {
  List<BxMallSubDto> bxMallSubBtoList = [];
  int bannerNavIndex = 0;
  String mallCategoryId = '4';
  String mallSubId = '';
  int page = 1;

  void setBxMallSubBtoList(List<BxMallSubDto> list, {String mallCategoryId}) {
    bannerNavIndex = 0;
    this.mallCategoryId = mallCategoryId ?? '4';
    page = 1;
    List<BxMallSubDto> bxMallSubDtoList = [
      BxMallSubDto(
        mallCategoryId: '4',
        mallSubId: '',
        mallSubName: '全部',
        comments: null,
      )
    ];
    bxMallSubDtoList.addAll(list);
    this.bxMallSubBtoList = bxMallSubDtoList;
    notifyListeners();
  }

  void changeBanneNavIndex(int index, String subId) {
    bannerNavIndex = index;
    mallSubId = subId;
    page = 1;
    notifyListeners();
  }

  void changePage() {
    page++;
    notifyListeners();
  }
}