import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperTop extends StatefulWidget {
  final List<Map> slides;
  SwiperTop({Key key, @required this.slides}) : super(key: key);

  @override
  _SwiperTopState createState() => _SwiperTopState();
}

class _SwiperTopState extends State<SwiperTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(333),
      width: ScreenUtil.getInstance().setWidth(750),
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network(widget.slides[index]['image'], fit: BoxFit.fill);
          },
          itemCount: widget.slides.length,
          pagination: SwiperPagination(),
          autoplay: true,
          onTap: (index) {
            Application.router.navigateTo(context, '/detailPage/${widget.slides[index]['goodsId']}');
          },
      ),
    );
  }
}