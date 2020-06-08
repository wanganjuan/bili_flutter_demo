import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperScreen extends StatefulWidget {
  SwiperScreen({Key key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  List<String> imgList = ['https://imgs.qunarzz.com/vc/44/e9/86/95bc36c9e1c06ebd68bdfe222e.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/6d/9f/35/b8ad5468f73fd60ec0ced086f6.jpg_92.jpg', 'https://imgs.qunarzz.com/vc/e3/a1/71/f498dfd3bed948d623c9093252.jpg_92.jpg'];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: Column(
           children: <Widget>[
             Flexible(
              child: Container(
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
             )
           ],
         ),
       ),
    );
  }
}