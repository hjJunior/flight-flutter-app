import 'package:flutter/material.dart';
import 'package:mvp/theme/colors.dart';

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