import 'package:flutter/material.dart';
import 'package:mvp/widgets/utils/airplane_icon.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          AirplaneIcon(
            degress: 25,
            color: active ? Color(0xFF7962ed) : Colors.grey[500],
            size: 32
          ),
          SizedBox(width: 5,),
          Text("219", style: TextStyle(color: !active ? Colors.grey[500] : Color(0xFF7962ed), fontSize: 16, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
