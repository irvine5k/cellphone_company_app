import 'package:flutter/material.dart';
import 'package:telzir_app/src/pages/result_page.dart';

class CallButton extends StatelessWidget {
  const CallButton({
    Key key,
    @required this.onTap
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: MaterialButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'FAZER CHAMADA',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 40,
                color: Colors.white,
              )
            ],
          ),
        ),
        onPressed: onTap,
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