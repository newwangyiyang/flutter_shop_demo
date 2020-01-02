import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/detail_page/detail_info_web.dart';

class DetailTab extends StatefulWidget {
  DetailTab({Key key}) : super(key: key);

  @override
  _DetailTabState createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(1100),
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title:  TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black26,
            labelStyle: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30)
            ),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.redAccent
                )
              )
            ),
            tabs: <Widget>[
               Tab(
                 text: '详情',
               ),
               Tab(
                 text: '评论',
               ),
            ],
          ),
        ),
        body:  TabBarView(controller: _tabController, children: <Widget>[
          SingleChildScrollView(
            child: DetailInfoWeb(),
            padding: EdgeInsets.only(bottom: 60),
          ),
          Center(
            child: Text('暂无更多评论信息...'),
          )
        ]),
      )

    );
  }
}