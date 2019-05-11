import 'package:flutter/material.dart';
import 'package:mvp/widgets/row/flight_tile.dart';

import 'custom_tab_bar.dart';

class HomeMainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
    );
  }
}
