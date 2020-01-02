import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:provide/provide.dart';

import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';


class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> _bottomNavigatorBarItemList= [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    ),
  ];

  final List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, cip) {
        int _currentIndex = cip.currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomNavigatorBarItemList,
            currentIndex: _currentIndex,
            onTap: (index) {
              cip.updateCurrentIndex(index);
            },
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _pageList
          ),
        );
      },
    );  
  }
}