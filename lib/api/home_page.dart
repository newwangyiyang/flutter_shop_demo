import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/utils/request.dart';
// 首页基础数据
Future getHomePageContent(data) async {
  return await Http.getInstance().post(servicePath['homePageContext'], data: data);
}
// 火爆专区
Future getHomePageBelowConten(data) async {
  return await Http.getInstance().post(servicePath['homePageBelowConten'], data: data);
}