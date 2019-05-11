import 'package:flutter/material.dart';
import 'package:mvp/model/home_model.dart';
import 'package:mvp/theme/colors.dart';
import 'package:mvp/widgets/utils/airplane_icon.dart';
import 'package:mvp/widgets/utils/circle.dart';

class FlightTile extends StatefulWidget {
  @override
  _FlightTileState createState() => _FlightTileState();
}

class _FlightTileState extends State<FlightTile> with SingleTickerProviderStateMixin {
  Animation<double> _containerHeightAnimation;
  Animation<double> _circleRadiusAnimation;
  Animation<Color> _containerColorAnimation;
  AnimationController  _containerAnimController;
  bool open = false;

  @override
  void initState() {
    super.initState();

    _containerAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    final curvedAnimation = CurvedAnimation(parent: _containerAnimController, curve: Curves.easeOut);

    _containerColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: highlightColor
    ).animate(curvedAnimation);

    _circleRadiusAnimation = Tween<double>(
      begin: 0.8,
      end: 2.6
    ).animate(curvedAnimation);

    _containerHeightAnimation = Tween<double>(
      begin: 60,
      end: 130
    ).animate(curvedAnimation);

    _containerAnimController.addStatusListener((status) {
      setState(() {
        open = status == AnimationStatus.completed;
      });
    });
  }

  void toggleOpen() {
   if (_containerAnimController.status == AnimationStatus.completed) {
     _containerAnimController.reverse();
     HomeModel.of(context).decrementOpenFlightTickets();
   } else {
     _containerAnimController.forward();
     HomeModel.of(context).incrementOpenFlightTickets();
   }
  }

  Color get textColor => open ? tabTabActivatedColor : Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleOpen,
      child: AnimatedBuilder(
        animation: _containerHeightAnimation,
        builder: (_, __) => Container(
          color: _containerColorAnimation.value,
          height: _containerHeightAnimation.value,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AnimatedBuilder(
                    builder: (_, __) {
                      final isCompleted = _circleRadiusAnimation.isCompleted;
                      return Transform.scale(
                        scale: _circleRadiusAnimation.value,
                        child: Circle(
                          color: isCompleted ? tabTabActivatedColor : dividerColor,
                          child: isCompleted ? Icon(Icons.check, color: Colors.white, size: 6,) : null,
                        ),
                      );
                    },
                    animation: _circleRadiusAnimation,
                  ),
                  _ConnectionAtAiportWidget(
                    on: DateTime.now(),
                    at: "Midway",
                    isCardOpen: open,
                  ),
                  AirplaneIcon(
                    degress: 90,
                    color: textColor,
                  ),
                  _ConnectionAtAiportWidget(
                    on: DateTime.now(),
                    at: "Midway",
                    isCardOpen: open,
                  ),
                  Text('341\$', style: TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.bold),)
                ],
              ),
              if (_containerHeightAnimation.isCompleted)
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('4th 34, Nonstop\nWifi, Video\nBoeing 737-900', style: TextStyle(color: textColor),),
                      Image.network(
                        'http://www.freelogovectors.net/wp-content/uploads/2018/08/Hawaiian_Airlines_logo.png',
                        fit: BoxFit.contain,
                        height: 35,
                      )
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


class _ConnectionAtAiportWidget extends StatelessWidget {
  _ConnectionAtAiportWidget({this.on, this.at, this.isCardOpen});

  final DateTime on;
  final String at;
  final bool isCardOpen;

  Color get textColor => isCardOpen ? tabTabActivatedColor : Colors.blueGrey;

  String get _on => "${on.hour.toString().padLeft(2, '0')}:${on.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(_on, style: TextStyle(fontSize: 17, color: textColor, fontWeight: FontWeight.bold),),
      Text(at, style: TextStyle(fontSize: 14, color: textColor),),
    ],
  );
}
