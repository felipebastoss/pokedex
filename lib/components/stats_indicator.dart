import 'package:flutter/material.dart';

class StatIndicator extends StatelessWidget {
  StatIndicator({this.statName, this.statValue, this.color});

  final String statName;
  final int statValue;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Text(
              statName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Flexible(
          child: SizedBox(
            height: 30,
            width: 300,
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  child: Center(
                    child: LinearProgressIndicator(
                      minHeight: 30.0,
                      value: statValue / 300,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                Center(
                  child: Text('$statValue/300'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
