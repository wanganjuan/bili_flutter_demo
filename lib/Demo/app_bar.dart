

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SelfAppBar extends StatefulWidget {
  SelfAppBar({Key key}) : super(key: key);

  @override
  _SelfAppBarState createState() => _SelfAppBarState();
}

class _SelfAppBarState extends State<SelfAppBar> {
  List<String> imgList = ['https://imgs.qunarzz.com/vc/44/e9/86/95bc36c9e1c06ebd68bdfe222e.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/6d/9f/35/b8ad5468f73fd60ec0ced086f6.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/e3/a1/71/f498dfd3bed948d623c9093252.jpg_92.jpg'];
  double _opacity = 0;
  _updateAppBarOpacity (offsetTop) {
    double temp = offsetTop / 100;
    if (temp < 0) {
      temp = 0;
    } else if (temp > 1) {
      temp = 1;
    }
    setState(() {
      _opacity = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         children: <Widget>[
           MediaQuery.removePadding(
              context:context,
              removeTop: true,
              child: NotificationListener(
                onNotification: (e) {
                  if (e is ScrollUpdateNotification && e.depth == 0) {
                    _updateAppBarOpacity(e.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(
                 children: <Widget>[
                     Container(
                      height: 160,
                      child: Swiper(
                        pagination: SwiperPagination(),
                        autoplay: true,
                        itemCount: imgList.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            imgList[index], fit: BoxFit.fill,
                          );
                        },
                       ),
                    ),
                    Container(
                      height: 1000,
                      color: Colors.blue,
                    )
                 ],
             ),
              ),
           ),
           Opacity(
             opacity: _opacity,
             child: Container(
               height: 40,
               color: Colors.white,
               child: Center(
                 child: Text('我是首页'),
               ),
             ),
           )
         ],
       ),
    );
  }
}