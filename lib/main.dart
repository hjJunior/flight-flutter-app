import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static const collapsedHeight = 120;

  AnimationController _planeRotateController;
  Animation<double> _planeRotateAnimation;
  final _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _planeRotateController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _planeRotateAnimation = Tween<double>(begin: 1.52, end: 0).animate(_planeRotateController);

//    _scrollController.addListener(() {
//      _planeRotateController.value = progressAnimation;
//    });
  }

  num get scrollOffsetRelativeAppBar => max(
    min(_scrollController.offset, collapsedHeight), 0
  );

  num get percentageRelativeAppBarScroll =>
    (100 * scrollOffsetRelativeAppBar) / collapsedHeight;

  double get progressAnimation =>
      1.52 * percentageRelativeAppBarScroll/100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          CustomAppBar(planeRotateAnimation: _planeRotateAnimation),
          Positioned.fill(
            top: 180,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 2,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200]
                              )
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TabItem(active: true),
                              TabItem(active: false,),
                              TabItem(active: false),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 3,
                                color: Color(0xFF7962ed),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 3,
                                color: Color(0x007962ed),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 3,
                                color: Color(0x007962ed),
                              ),
                            ),
                          ],
                        ),
                      ],
                      alignment: Alignment.bottomCenter,
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (_, index) => FlightItem()
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FlightItem extends StatelessWidget {
  const FlightItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('clicked'),
      splashColor: Color(0x50c685ff),
      highlightColor: Color(0x50c685ff),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50)
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('08:00 am', style: TextStyle(fontSize: 17, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                Text('Midway', style: TextStyle(fontSize: 14, color: Colors.blueGrey),),
              ],
            ),
            Transform.rotate(
              angle: 1.52,
              child: Icon(
                Icons.airplanemode_active,
                color: Colors.blueGrey,
                size: 18,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('10:00 pm', style: TextStyle(fontSize: 17, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                Text('Tacoma Intl.', style: TextStyle(fontSize: 14, color: Colors.blueGrey),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('341\$', style: TextStyle(fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    this.active
  }) : super(key: key);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Transform.rotate(
            angle: pi * 0.15,
            child: Icon(Icons.airplanemode_active, color: !active ? Colors.grey[500] : Color(0xFF7962ed), size: 32,),
          ),
          SizedBox(width: 10,),
          Text("219\$", style: TextStyle(color: !active ? Colors.grey[500] : Color(0xFF7962ed), fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required Animation<double> planeRotateAnimation,
  }) : _planeRotateAnimation = planeRotateAnimation, super(key: key);

  final Animation<double> _planeRotateAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.network(
            'https://cdn.vox-cdn.com/thumbor/KPpUehM5r07vhw4v0PNL8LeYPSo=/0x0:7456x4973/1200x900/filters:focal(3933x1904:5125x3096)/cdn.vox-cdn.com/uploads/chorus_image/image/58135269/GettyImages_1142764477.29.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            height: 310,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xAA48a7f0),
                  Color(0xAA8e7cf7),
                  Color(0xAAc44be0),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('FLYING FROM', style: TextStyle(color: Colors.white, letterSpacing: .3, fontSize: 11)),
                    Text('CHICAGO', style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold),),
                    Text('All airports', style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    AnimatedBuilder(
                      animation: _planeRotateAnimation,
                      builder: (_, __) => Transform.rotate(
                        angle: _planeRotateAnimation.value,
                        child: Icon(
                          Icons.airplanemode_active,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('FLYING TO', style: TextStyle(color: Colors.white, letterSpacing: .3, fontSize: 11)),
                    Text('SEATTLE', style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold),),
                    Text('Tacoma Intl.', style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}