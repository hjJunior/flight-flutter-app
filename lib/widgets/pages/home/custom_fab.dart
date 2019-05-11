import 'package:flutter/material.dart';
import 'package:mvp/theme/colors.dart';

class CustomFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 64,),
      child: Material(
        elevation: 8,
        shape: StadiumBorder(),
        child: GestureDetector(
          onTap: () => print('hello'),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16
            ),
            decoration: BoxDecoration(
                color: tabTabActivatedColor,
                borderRadius: BorderRadius.circular(50),
                gradient: fabLinearGradient
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.credit_card, color: Colors.white,),
                SizedBox(width: 10,),
                Text('PROCEED 341\$ ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
