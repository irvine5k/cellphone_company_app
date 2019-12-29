import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;
  final bool backButton;

  CustomAppBar(this.title, {this.backButton = false});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: Row(
        mainAxisAlignment: backButton ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: <Widget>[
          backButton
              ? Container(
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
              )
              : Container(),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 0.5],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
