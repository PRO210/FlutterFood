import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double width;
  final double heigth;
  final String textLabel;
  const CustomCircularProgressIndicator(
      {this.width = 20, this.heigth = 20, @required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            width: width,
            height: heigth,
            child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor),
          ),
          Text(
            textLabel,
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
