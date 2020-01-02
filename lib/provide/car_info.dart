import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_shop/model/car_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarInfoProvide with ChangeNotifier {
  List<CarInfoDto> carList = [];

  double goodsAllPrice = 0;
  int goodsNum = 0;

  bool isAllCheck = true;

  void updateCarList(CarInfoDto carInfoDto) async {
    bool hasGoods = carList.any((item) => item.goodsId == carInfoDto.goodsId);
    if(hasGoods) {
      CarInfoDto goods = carList.firstWhere((item) => item.goodsId == carInfoDto.goodsId);
      goods.count++;
    } else {
      carList.add(carInfoDto);
    }

    EasyLoading.showSuccess('已成功添加到购物车');

    updateGoodsNumAndPrice();
  }

  getCarList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String carListStr = prefs.get('carList');
    if(carListStr != null) {
      List carListTemp = json.decode(carListStr);
      carList = carListTemp.map((item) => CarInfoDto.fromJson(item)).toList();
    }

    updateGoodsNumAndPrice();
  }

  void clearCarList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('carList');
    carList.clear();

    updateGoodsNumAndPrice();
  }

  void deleteCarList(String goodsId) async {
    CarInfoDto carInfoDto = carList.firstWhere((item) => item.goodsId == goodsId);
    if(carInfoDto != null) {

      carList.remove(carInfoDto);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String carListStr = json.encode(carList.map((item) => item.toJson()).toList());
      prefs.setString('carList', carListStr);

      EasyLoading.showSuccess('已成功删除');

      updateGoodsNumAndPrice();
    }
  }

  void updateGoodsChecked(String goodsId) {
    CarInfoDto carInfoDto = carList.firstWhere((item) => item.goodsId == goodsId);
    carInfoDto.isCheck = !carInfoDto.isCheck;

    isAllCheck = carList.every((item) => item.isCheck);

    updateGoodsNumAndPrice();
  }

  void updateAllSelectedChecked(bool isAllCheck) {
    this.isAllCheck = isAllCheck;
    carList = carList.map((item) {
      item.isCheck = isAllCheck;
      return item;
    }).toList();

    updateGoodsNumAndPrice();
  }

  void updateGoodsCount(String goodsId, {bool isAdd}) {
    CarInfoDto carInfoDto = carList.firstWhere((item) => item.goodsId == goodsId);
    isAdd != null ?
    carInfoDto.count++ :
    carInfoDto.count--; 

    updateGoodsNumAndPrice();
  }

  void updateGoodsNumAndPrice() async {
    List<CarInfoDto> checkList = carList.where((item) => item.isCheck).toList();
    goodsNum = checkList.length;
    goodsAllPrice =  checkList.fold(0, (a, b) => (a + b.count * b.price));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String carListStr = json.encode(carList.map((item) => item.toJson()).toList());
    prefs.setString('carList', carListStr);

    notifyListeners();
  }


}