import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvp/widgets/row/flight_tile.dart';

import 'custom_tab_bar.dart';

class HomeMainContent extends StatefulWidget {
  @override
  _HomeMainContentState createState() => _HomeMainContentState();
}

class _HomeMainContentState extends State<HomeMainContent> with SingleTickerProviderStateMixin {
  static const collapsedHeight = 180;
  final _scrollController = ScrollController();
  Animation<double> _animationContainerScroll;
  Animation<double> _animationPositionTopScroll;
  Animation<double> _animationPositionHorizontalScroll;
  AnimationController _animationController;

  num get scrollOffsetRelativeAppBar => min(
    _scrollController.offset, collapsedHeight
  );

  num get percentageRelativeAppBarScroll =>
    (100 * scrollOffsetRelativeAppBar) / collapsedHeight;

  double get progressAnimation => percentageRelativeAppBarScroll/100;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    final easyInAnimate = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController,
      reverseCurve: Curves.easeInOutCubic
    );

    _animationPositionTopScroll = Tween<double>(
      begin: 180,
      end: 0
    ).animate(easyInAnimate);

    _animationContainerScroll = Tween<double>(
      begin: 0,
      end: 20
    ).animate(easyInAnimate);

    _animationPositionHorizontalScroll = Tween<double>(
      begin: 20,
      end: 0
    ).animate(easyInAnimate);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationPositionTopScroll,
      builder: (_, __) => Positioned.fill(
        top: _animationPositionTopScroll.value,
        left: _animationPositionHorizontalScroll.value,
        right: _animationPositionHorizontalScroll.value,
        child: Container(
          padding: EdgeInsets.only(top: _animationContainerScroll.value),
          color: Colors.white,
          child: Card(
            elevation: _animationContainerScroll.value > .5 ? 0 : 2,
            child: Column(
              children: <Widget>[
                CustomTabBar(),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (onScroll) {
                      if (onScroll is ScrollEndNotification) {
                        if (progressAnimation > .3) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      } else if (onScroll is ScrollUpdateNotification) {
                        _animationController.value = progressAnimation;
                      }
                    },
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, index) => FlightTile(),
                          )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
