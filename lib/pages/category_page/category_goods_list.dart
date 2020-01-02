import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/api/category_page.dart';
import 'package:flutter_shop/model/categorey_goods_list.dart';
import 'package:flutter_shop/provide/category.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  EasyRefreshController _easyRefreshController = EasyRefreshController();
  bool finishLoad = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, cglp) {
        try {
          if(Provide.value<CategoryProvide>(context).page == 1) {
            _scrollController.jumpTo(0);
          }
        } catch (e) {
          // 第一次进入系统
          print('第一次进入系统: $e');
        }

        List<CategoryGoodsListDto> list = cglp.goodsList;
        return list.length > 0 ? Expanded(
          child: Container(
            width: ScreenUtil.getInstance().setWidth(570),
            child: EasyRefresh(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  CategoryGoodsListDto item = list[index];
                  return InkWell(
                    onTap: (){
                      Application.router.navigateTo(context, '/detailPage/${item.goodsId}');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      height: ScreenUtil.getInstance().setHeight(230),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: .5,
                            color: Colors.black12
                          )
                        )
                      ),
                      child: Row(
                          children: <Widget>[
                            _itemImage(item),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                _itemTitle(item),
                                _itemPrice(item)
                              ],
                            )
                          ],
                        ),
                    ),
                  );
                },
              ),
              controller: _easyRefreshController,
              onLoad: () async{
                _getCategoryGoodsListData();
              },
              enableControlFinishLoad: finishLoad,
              footer: BezierBounceFooter(
                backgroundColor: Colors.redAccent
              ),
            ),
          ),
        ) : 
        Expanded(
          child: Center(
            child: Text('暂无数据...'),
          ),
        );
      },
    );
  }

  void _getCategoryGoodsListData() async {
    final ph = Provide.value<CategoryProvide>(context);
    ph.changePage();
    Map data = {
      'categoryId': ph.mallCategoryId,
      'categorySubId': ph.mallSubId,
      'page': ph.page
    };
    String resStr = await getMallGoods(data: data);
    List res = json.decode(resStr)['data'];
    if(res == null) {
      Fluttertoast.showToast(
        msg: '数据已全部加载完毕...',
        gravity: ToastGravity.CENTER
      );
    } else {
      final phL = Provide.value<CategoryGoodsListProvide>(context);
      List<CategoryGoodsListDto> list = phL.goodsList;
      list.addAll(res.map((item) => CategoryGoodsListDto.fromJson(item)).toList());
      phL.changeGoodsList(list);
    }

  }


  Widget _itemImage(CategoryGoodsListDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(200),
      child: Image.network(
        item.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _itemTitle(CategoryGoodsListDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(370),
      child: Text(
        item.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(26),
        ),
      ),
    );
  }

  Widget _itemPrice(CategoryGoodsListDto item) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(370),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '价格: ￥${item.presentPrice}',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: ScreenUtil.getInstance().setSp(26)
            ),
          ),
          Text(
            '原价: ￥${item.oriPrice}',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(20),
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

}