import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  PageViewDemo({Key key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int _curIndex = 0;
  PageController pc = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView(
         onPageChanged: (index) {
          setState(() {
             _curIndex = index;
           });
         },
         controller: pc,
         children: <Widget>[
           Container(
              color: Colors.red,
              height: double.infinity,
              width: double.infinity,
           ),
            Container(
              color: Colors.blue,
              height: double.infinity,
              width: double.infinity,
           ),
            Container(
              color: Colors.yellow,
              height: double.infinity,
              width: double.infinity,
           ),
           Container(
              color: Colors.black,
              height: double.infinity,
              width: double.infinity,
           )
         ],
       ),
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         currentIndex: _curIndex,
         onTap: (index) {
           setState(() {
             _curIndex = index;
           });
           pc.jumpToPage(index);
         },
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
           BottomNavigationBarItem(icon: Icon(Icons.devices_other), title: Text('其他')),
           BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('首页')),
           BottomNavigationBarItem(icon: Icon(Icons.print), title: Text('首页'))
         ],
       ),
    );
  }
}