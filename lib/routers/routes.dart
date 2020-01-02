import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_shop/routers/router_handler.dart';


class Routes {
  static String root = '/';
  static String detailPage = '/detailPage/:id';
  static void configRoutes(Router router) {
    router.notFoundHandler = Handler( // 未找到路由的配置，可跳转到固定页面，或进行相应提示
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        EasyLoading.showError('未找到对应页面');
      }
    );

    // 配置路由（很重要）
    router..define(detailPage, handler: detailHandler);

  }
}