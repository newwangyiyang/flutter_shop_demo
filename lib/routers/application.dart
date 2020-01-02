import 'package:fluro/fluro.dart';

class Application {
  // 将路由静态化, 可直接使用Application.router进行获取路由，而不用每次都进行new Router() 
  static Router router;
}