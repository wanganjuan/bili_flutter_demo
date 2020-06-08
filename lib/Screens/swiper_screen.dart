import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperScreen extends StatefulWidget {
  SwiperScreen({Key key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  double _appBarOpacity = 0;
  List<String> imgList = ['https://imgs.qunarzz.com/vc/44/e9/86/95bc36c9e1c06ebd68bdfe222e.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/6d/9f/35/b8ad5468f73fd60ec0ced086f6.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/e3/a1/71/f498dfd3bed948d623c9093252.jpg_92.jpg'];
  _scrollEvent (offset) {
    double temp = offset / 160;
    if (temp < 0 ) {
      temp = 0; 
    } else if (temp > 1) {
      temp = 1;
    }
    setState(() {
      _appBarOpacity = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (e) {
                  if (e is ScrollUpdateNotification && e.depth == 0) {
                    _scrollEvent(e.metrics.pixels);
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
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
          ),
          Opacity(
            opacity: _appBarOpacity,
            child: Container(
              color: Colors.white,
              height: 40,
              child: Center(child: Text('我是首页')),
            ),
          )
        ],
      ),
    );
  }
}