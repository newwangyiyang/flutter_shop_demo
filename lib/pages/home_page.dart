import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_shop/api/home_page.dart';
import 'package:flutter_shop/pages/home_page/ad_banner.dart';
import 'package:flutter_shop/pages/home_page/floor_goods.dart';
import 'package:flutter_shop/pages/home_page/hot_goods.dart';
import 'package:flutter_shop/pages/home_page/leader_phone.dart';
import 'package:flutter_shop/pages/home_page/navigation_floor1.dart';
import 'package:flutter_shop/pages/home_page/recommend.dart';
import 'package:flutter_shop/pages/home_page/swiper_top.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int page = 1;

  List<Map> hotGoodsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: getHomePageContent({'lon':'115.02932','lat':'35.76189'}),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget container = Container(
            child: Center(
              child: Text('数据加载中...'),
            ),
          );
          if(snapshot.hasData) {
            Map<String, dynamic> data = json.decode(snapshot.data.toString());
            // 轮播图数据
            List<Map> slides = (data['data']['slides'] as List).cast();
            // 导航区域
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            navigatorList.removeRange(10, navigatorList.length);
            // 广告banner
            String adBannerImg = data['data']['advertesPicture']['PICTURE_ADDRESS'];
            // LeaderPhone
            Map shopInfo = data['data']['shopInfo'];
            // recommend
            List<Map> recommendList = (data['data']['recommend'] as List).cast();
            // floorGoods
            List<Map> floorGoods = [
              {
                'floorPic': data['data']['floor1Pic'],
                'floor': (data['data']['floor1'] as List).cast()
              },
              {
                'floorPic': data['data']['floor2Pic'],
                'floor': (data['data']['floor2'] as List).cast()
              },
              {
                'floorPic': data['data']['floor3Pic'],
                'floor': (data['data']['floor3'] as List).cast()
              },
            ];

            container = EasyRefresh(
              child: ListView(
                children: <Widget>[
                  SwiperTop(slides: slides),
                  NavigationFloor1(navigatorList: navigatorList),
                  AdBanner(adBannerImage: adBannerImg),
                  LeaderPhone(shopInfo: shopInfo),
                  Recommend(recommendList: recommendList),
                  Column(
                    children: floorGoods.map((floorGoods) => FloorGoods(floorGoods: floorGoods)).toList(),
                  ),

                  // 热门商品区域
                  HotGoods(hotGoodsList: hotGoodsList)
                ],
              ),
              onLoad: () async {
                String resStr = await getHomePageBelowConten(page);
                print(page);
                var res = json.decode(resStr);
                List<Map> list = (res['data'] as List).cast();
                setState(() {
                  page++;
                  hotGoodsList.addAll(list);
                });
              },
              footer: BezierBounceFooter(
                backgroundColor: Colors.redAccent
              ),
            );
          }
          return container;
        },
      )
    );
  }
}