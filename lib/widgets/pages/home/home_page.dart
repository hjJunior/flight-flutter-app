import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvp/widgets/pages/home/custom_app_bar.dart';
import 'custom_fab.dart';
import 'home_main_content.dart';


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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFab(),
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          CustomAppBar(planeRotateAnimation: _planeRotateAnimation),
          HomeMainContent()
        ],
      ),
    );
  }
}
