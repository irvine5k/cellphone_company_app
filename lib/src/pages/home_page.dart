import 'package:flutter/material.dart';
import 'package:telzir_app/src/blocs/call_bloc.dart';
import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/pages/result_page.dart';
import 'package:telzir_app/src/utils/plan_type.dart';
import 'package:telzir_app/src/widgets/add_minutes_button.dart';
import 'package:telzir_app/src/widgets/call_button.dart';
import 'package:telzir_app/src/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CallBloc _callBloc;

  @override
  void initState() {
    _callBloc = CallBloc();
    super.initState();
  }

  @override
  void dispose() {
    _callBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: buildBody(),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      child: CustomAppBar('TELZIR'),
      preferredSize: Size.fromHeight(60),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildFromDddDropdown(),
                          SizedBox(height: 20),
                          buildToDddDropdown(),
                          SizedBox(height: 20),
                          buildPlansDropdown(),
                          SizedBox(height: 20),
                          buildMinutesDropdown(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder<CallModel>(
            stream: _callBloc.getCallModel,
            builder: (context, snapshot) {
              return CallButton(
                onTap: () {
                  if (snapshot.hasData) {
                    goToResultPage(context, snapshot.data);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Column buildToDddDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'DESTINO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        StreamBuilder<String>(
          stream: _callBloc.getToDDD,
          builder: (context, snapshot) {
            return DropdownButtonFormField(
              value: snapshot.data,
              hint: Text(
                'DDD DE DESTINO',
              ),
              items: [
                DropdownMenuItem(
                  value: '011',
                  child: Text('011'),
                ),
                DropdownMenuItem(
                  value: '016',
                  child: Text('016'),
                ),
                DropdownMenuItem(
                  value: '017',
                  child: Text('017'),
                ),
                DropdownMenuItem(
                  value: '018',
                  child: Text('018'),
                )
              ],
              onChanged: _callBloc.addToDDD.add,
            );
          },
        ),
      ],
    );
  }

  Column buildFromDddDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ORIGEM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        StreamBuilder<String>(
          stream: _callBloc.getFromDDD,
          builder: (context, snapshot) {
            return DropdownButtonFormField(
              value: snapshot.data,
              hint: Text('DDD DE ORIGEM'),
              items: [
                DropdownMenuItem(
                  value: '011',
                  child: Text('011'),
                ),
                DropdownMenuItem(
                  value: '016',
                  child: Text('016'),
                ),
                DropdownMenuItem(
                  value: '017',
                  child: Text('017'),
                ),
                DropdownMenuItem(
                  value: '018',
                  child: Text('018'),
                )
              ],
              onChanged: _callBloc.addFromDDD.add,
            );
          },
        ),
      ],
    );
  }

  Column buildMinutesDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'MINUTOS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Container(
                color: Colors.grey[100],
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: StreamBuilder<int>(
                  stream: _callBloc.getMinutes,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString());
                  },
                ),
              ),
            ),
            AddMinutesButton(
              minutes: 1,
              onTap: _callBloc.addMinutes,
            ),
            AddMinutesButton(
              minutes: -1,
              onTap: _callBloc.addMinutes,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            AddMinutesButton(
              minutes: 10,
              onTap: _callBloc.addMinutes,
            ),
            AddMinutesButton(
              minutes: -10,
              onTap: _callBloc.addMinutes,
            ),
          ],
        ),
      ],
    );
  }

  Column buildPlansDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'PLANOS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        StreamBuilder<PlanType>(
          stream: _callBloc.getPlanType,
          builder: (context, snapshot) {
            return DropdownButtonFormField(
              value: snapshot.data,
              hint: Text(
                'PLANO',
              ),
              items: [
                DropdownMenuItem(
                  value: PlanType.faleMais30,
                  child: Text('Fale Mais 30'),
                ),
                DropdownMenuItem(
                  value: PlanType.faleMais60,
                  child: Text('Fale Mais 60'),
                ),
                DropdownMenuItem(
                  value: PlanType.faleMais120,
                  child: Text('Fale Mais 120'),
                ),
              ],
              onChanged: _callBloc.addPlanType.add,
            );
          },
        ),
      ],
    );
  }

  Future<void> goToResultPage(BuildContext context, CallModel callModel) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(callModel: callModel),
      ),
    );
  }
}
