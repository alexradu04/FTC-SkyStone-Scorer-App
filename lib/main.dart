import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:ui';
import './final_scores.dart';
import './score_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FTC Scorer',
      theme: ThemeData(
          primarySwatch: Colors.blue[1000],
          accentColor: Colors.green,
          errorColor: Colors.red,
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
              )),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                  )))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Map<String, Object>> data = [
    {
      'Fundation': false,
      'ParkedBots1': false,
      'ParkedBots2': false,
      'StonesDelivered': 0,
      'StonesPlaced': 0,
      'SkyStoneBonus': 0
    },
  ];
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'FTC Scorer',
            ),
          )
        : AppBar(
            title: Text(
              'FTC Scorer',
            ),
            backgroundColor: Theme.of(context).primaryColor,
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: ScoreShower(data),
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: Column(
              children: <Widget>[
                Container(
                  height:( MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top )*0.3,
                  width: double.infinity,
                  child: ScoreShower(data)
                  ),
                Container(
                    height:( MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top )*0.7,
                      width: double.infinity,
                    child: ScoreChanger(data)),
              ],
            ),
          );
  }
}
