import 'package:flutter/material.dart';
import 'package:mvp/theme/colors.dart';
import 'package:mvp/widgets/utils/airplane_icon.dart';
import 'package:mvp/widgets/utils/circle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

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
              gradient: headerLinearGradient,
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
                    Circle(
                      color: Colors.white,
                      radius: 3.0,
                    ),
                    SizedBox(width: 5,),
                    Circle(
                      color: Colors.white,
                      radius: 6.0,
                    ),
                    SizedBox(width: 5,),
                    Circle(
                      color: Colors.white,
                      radius: 8.0,
                    ),
                    SizedBox(width: 5,),
                    AirplaneIcon(
                      color: Colors.white,
                      size: 32,
                      degress: 90,
                    ),
                    SizedBox(width: 5,),
                    Circle(
                      color: Colors.white,
                      radius: 8.0,
                    ),
                    SizedBox(width: 5,),
                    Circle(
                      color: Colors.white,
                      radius: 6.0,
                    ),
                    SizedBox(width: 5,),
                    Circle(
                      color: Colors.white,
                      radius: 3.0,
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