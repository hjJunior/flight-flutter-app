import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvp/widgets/pages/home/custom_app_bar.dart';
import 'package:mvp/widgets/pages/home/custom_tab_bar.dart';
import 'package:mvp/widgets/row/flight_tile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
                    CustomTabBar(),
                    Expanded(
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (_, index) => FlightTile()
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
