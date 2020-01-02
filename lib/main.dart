import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_shop/provide/car_info.dart';
import 'package:flutter_shop/provide/category.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:flutter_shop/provide/detail_goods.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';

void main() => 
  runApp(
    ProviderNode(
      providers: Providers()
                  ..provide(Provider.function((context) => Counter()))
                  ..provide(Provider.function((context) => CategoryGoodsListProvide()))
                  ..provide(Provider.function((context) => CategoryProvide()))
                  ..provide(Provider.function((context) => DateilGoodsProvide()))
                  ..provide(Provider.function((context) => CarInfoProvide()))
                  ..provide(Provider.function((context) => CurrentIndexProvide())),
      child: MyApp(),
    )
  );
  

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 注入路由
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;


    return FlutterEasyLoading(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: Scaffold(
          body: IndexPage(),
        ),
      ),
    );
  }
}