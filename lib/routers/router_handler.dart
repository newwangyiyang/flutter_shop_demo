import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/detail_page.dart';

Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return DetailPage(goodsId: params['id'][0],);
  }
);

