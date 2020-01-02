import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/utils/request.dart';

Future getCategory({data}) async {
  return await Http.getInstance().post(servicePath['getCategory'], data: data);
}

Future getMallGoods({data}) async {
  return await Http.getInstance().post(servicePath['getMallGoods'], data: data);
}