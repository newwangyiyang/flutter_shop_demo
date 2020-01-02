import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String adBannerImage;
  const AdBanner({Key key, @required this.adBannerImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        adBannerImage
      ),
    );
  }
}