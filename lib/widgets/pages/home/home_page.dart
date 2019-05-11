import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvp/model/home_model.dart';
import 'package:mvp/widgets/pages/home/custom_app_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'custom_fab.dart';
import 'home_main_content.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
      builder: (context, _, model) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: model.showFab ? CustomFab() : null,
          body: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: <Widget>[
              CustomAppBar(),
              HomeMainContent()
            ],
          ),
        );
      }
    );
  }
}
