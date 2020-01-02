import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/utils/request.dart';

Future getGoodsDetailInfo(String goodId) async {
  return await Http.getInstance().post(servicePath['getGoodDetailById'], data: {'goodId': goodId});
}