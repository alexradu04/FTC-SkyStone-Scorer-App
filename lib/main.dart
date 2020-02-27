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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, Object>> data = [
    {
      'Fundation': false,
      'ParkedBots1': false,
      'ParkedBots2': false,
      'StonesDelivered': 0,
      'StonesPlaced': 0,
      'SkyStoneBonus': 0
    },
    {
      'StonesDelivered': 0,
      'StonesPlaced': 0,
      'SkyScraperHeight': 0,
    }
  ];
  void updateFirstBot() {
    setState(() {
      data[0]['ParkedBots1'] = !(data[0]['ParkedBots1']);
    });
  }

  void updateFundation(val) {
    setState(() {
      data[0]['Fundation'] = val as bool;
    });
  }

  void updateSecondBot() {
    setState(() {
      data[0]['ParkedBots2'] = !data[0]['ParkedBots2'];
    });
  }

  void decreaseStonesDelivered() {
    setState(() {
      int x = data[0]['StonesDelivered'];
      if (x > 0) {
        data[0]['StonesDelivered'] = (data[0]['StonesDelivered'] as int) - 1;
        x = data[0]['StonesDelivered'];
        int y = data[0]['StonesPlaced'];
        if (x < y) {
          data[0]['StonesPlaced'] = (data[0]['StonesPlaced'] as int) - 1;
        }
        int z = data[0]['SkyStoneBonus'];
        if (x < z) {
          data[0]['SkyStoneBonus'] = (data[0]['SkyStoneBonus'] as int) - 1;
        }
        x = data[1]['StonesDelivered'];
        if(x>0) {
        data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) - 1;
        x = data[1]['StonesDelivered'];
        y = data[1]['StonesPlaced'];
        if (x < y) {
          data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) - 1;
        }
        }
      }
    });
  }

  void increaseStonesDelivered() {
    setState(() {
      data[0]['StonesDelivered'] = (data[0]['StonesDelivered'] as int) + 1;
      data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) + 1;
    });
  }

  void decreaseStonesPlaced() {
    setState(() {
      int x = data[0]['StonesPlaced'];
      if (x > 0) {
        data[0]['StonesPlaced'] = (data[0]['StonesPlaced'] as int) - 1;
        x = data[0]['StonesDelivered'] as int;
        int y = data[0]['StonesPlaced'] as int;
        if ((x < y))
          data[0]['StonesDelivered'] = (data[0]['StonesDelivered'] as int) - 1;

        data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) - 1;
        x = data[1]['StonesDelivered'] as int;
        y = data[1]['StonesPlaced'] as int;
        if ((x < y))
          data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) - 1;
      }
    });
  }

  void increaseStonesPlaced() {
    setState(() {
      data[0]['StonesPlaced'] = (data[0]['StonesPlaced'] as int) + 1;
      int x = data[0]['StonesDelivered'] as int;
      int y = data[0]['StonesPlaced'] as int;
      if (x < y)
        data[0]['StonesDelivered'] = (data[0]['StonesDelivered'] as int) + 1;
      data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) + 1;
      x = data[1]['StonesDelivered'] as int;
      y = data[1]['StonesPlaced'] as int;
      if (x < y)
        data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) + 1;
    });
  }

  void decreaseSkystoneBonus() {
    setState(() {
      final int x = data[0]['SkyStoneBonus'];
      if (x > 0)
        data[0]['SkyStoneBonus'] = (data[0]['SkyStoneBonus'] as int) - 1;
    });
  }

  void increaseSkystoneBonus() {
    setState(() {
      int x = data[0]['SkyStoneBonus'];
      if (x < 2)
        data[0]['SkyStoneBonus'] = (data[0]['SkyStoneBonus'] as int) + 1;
      x = data[0]['SkyStoneBonus'];
      int y = data[0]['StonesPlaced'];
      if (x > y) {
        increaseStonesPlaced();
      }
    });
  }

  void increaseStonesPlacedTeleop() {
    setState(() {
      data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) + 1;
      final int x = data[1]['StonesDelivered'] as int;
      final int y = data[1]['StonesPlaced'] as int;
      if (x < y)
        data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) + 1;
    });
  }

  void decreaseStonesPlacedTeleop() {
    setState(() {
      int x = data[1]['StonesPlaced'];
      if (x > 0) {
        data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) - 1;
        x = data[1]['StonesDelivered'] as int;
        final int y = data[1]['StonesPlaced'] as int;
        final int z = data[1]['SkyScraperHeight'];
        if ((y < z))
          data[1]['SkyScraperHeight'] =
              (data[1]['SkyScraperHeight'] as int) - 1;
      }
    });
  }

  void increaseStonesDeliveredTeleop() {
    setState(() {
      data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) + 1;
    });
  }

  void decreaseStonesDeliveredTeleop() {
    setState(() {
      int x = data[1]['StonesDelivered'];
      if (x > 0) {
        data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) - 1;
        x = data[1]['StonesDelivered'];
        int y = data[1]['StonesPlaced'];
        int z = data[1]['SkyScraperHeight'];
        if (x < y) {
          data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) - 1;
        }
        y = data[1]['StonesPlaced'];
        if (y < z) {
          data[1]['SkyScraperHeight'] =
              (data[1]['SkyScraperHeight'] as int) - 1;
        }
      }
    });
  }

  void increaseSkyScraperHeight() {
    setState(() {
      data[1]['SkyScraperHeight'] = (data[1]['SkyScraperHeight'] as int) + 1;
      int x = data[1]['SkyScraperHeight'] as int;
      int y = data[1]['StonesDelivered'] as int;
      int z = data[1]['StonesPlaced'] as int;
      if (x > y) {
        data[1]['StonesDelivered'] = (data[1]['StonesDelivered'] as int) + 1;
      }
      if (x > z) {
        data[1]['StonesPlaced'] = (data[1]['StonesPlaced'] as int) + 1;
      }
    });
  }

  void decreaseSkyScraperHeight() {
    setState(() {
      int x = data[1]['SkyScraperHeight'] as int;
      int y = data[1]['StonesDelivered'] as int;
      int z = data[1]['StonesPlaced'] as int;
      if (x > 0) {
        data[1]['SkyScraperHeight'] = (data[1]['SkyScraperHeight'] as int) - 1;
      }
    });
  }

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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final topChartLandscape=Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) ,
        width: MediaQuery.of(context).size.width *0.5,
        child: ScoreShower(data));
      final trueBodyLandscape=Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) ,
        width: MediaQuery.of(context).size.width *0.5,
        child: ScoreChanger(
          data,
          updateFirstBot: updateFirstBot,
          updateSecondBot: updateSecondBot,
          updateFundation: updateFundation,
          increaseSkystoneBonus: increaseSkystoneBonus,
          increaseStonesDelivered: increaseStonesDelivered,
          increaseStonesPlaced: increaseStonesPlaced,
          decreaseSkystoneBonus: decreaseSkystoneBonus,
          decreaseStonesDelivered: decreaseStonesDelivered,
          decreaseStonesPlaced: decreaseStonesPlaced,
          decreaseSkyScraperHeight: decreaseSkyScraperHeight,
          decreaseStonesDeliveredTeleop: decreaseStonesDeliveredTeleop,
          decreaseStonesPlacedTeleop: decreaseStonesPlacedTeleop,
          increaseSkyScraperHeight: increaseSkyScraperHeight,
          increaseStonesDeliveredTeleop: increaseStonesDeliveredTeleop,
          increaseStonesPlacedTeleop: increaseStonesPlacedTeleop,
        )); 
    final topChart = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.2,
        width: double.infinity,
        child: ScoreShower(data));
    final trueBody = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.80,
        width: double.infinity,
        child: ScoreChanger(
          data,
          updateFirstBot: updateFirstBot,
          updateSecondBot: updateSecondBot,
          updateFundation: updateFundation,
          increaseSkystoneBonus: increaseSkystoneBonus,
          increaseStonesDelivered: increaseStonesDelivered,
          increaseStonesPlaced: increaseStonesPlaced,
          decreaseSkystoneBonus: decreaseSkystoneBonus,
          decreaseStonesDelivered: decreaseStonesDelivered,
          decreaseStonesPlaced: decreaseStonesPlaced,
          decreaseSkyScraperHeight: decreaseSkyScraperHeight,
          decreaseStonesDeliveredTeleop: decreaseStonesDeliveredTeleop,
          decreaseStonesPlacedTeleop: decreaseStonesPlacedTeleop,
          increaseSkyScraperHeight: increaseSkyScraperHeight,
          increaseStonesDeliveredTeleop: increaseStonesDeliveredTeleop,
          increaseStonesPlacedTeleop: increaseStonesPlacedTeleop,
        ));
    
    

    return Scaffold(
      appBar: appBar,
      body: isPortrait ? Column(
        children: <Widget>[
           topChart, 
           trueBody 
        ],
      ):
      Row(children: <Widget>[
        topChartLandscape,
        trueBodyLandscape
      ],)
    );
  }
}
