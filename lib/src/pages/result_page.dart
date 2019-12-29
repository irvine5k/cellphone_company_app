import 'package:flutter/material.dart';
import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/widgets/custom_app_bar.dart';

class ResultPage extends StatelessWidget {
  final CallModel callModel;

  const ResultPage({Key key, @required this.callModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Column(
        children: <Widget>[
          buildCard(context, 'SEM PLANO', callModel.priceWithoutPlan),
          buildCard(context, 'COM PLANO', callModel.priceWithPlan),
        ],
      ),
    );
  }

  Expanded buildCard(BuildContext context, String title, double value) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'R\$ $value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      child: CustomAppBar('TELZIR', backButton: true),
      preferredSize: Size.fromHeight(60),
    );
  }
}
