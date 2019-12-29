import 'package:flutter/material.dart';

class AddMinutesButton extends StatelessWidget {
  const AddMinutesButton({
    Key key,
    @required this.onTap,
    @required this.minutes,
  }) : super(key: key);

  final Function(int) onTap;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Center(
              child: Text(
                '${minutes > 0 ? '+' : ''}$minutes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 0.5],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          onTap: () => onTap(minutes)),
    );
  }
}
