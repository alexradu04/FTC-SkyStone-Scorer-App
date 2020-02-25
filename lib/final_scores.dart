import 'package:flutter/material.dart';

class ScoreShower extends StatelessWidget {
  List<Map<String, Object>> data;
  ScoreShower(this.data);
  int get autoData {
    int sum=0;
    if(data[0]['Fundation']) sum+=10;
    if(data[0]['ParkedBots1']) sum+=5;
    if(data[0]['ParkedBots2']) sum+=5;
    sum+=(data[0]['StonesDelivered'] as int) *2;
    sum+=(data[0]['StonesPlaced'] as int) *4;
    sum+=(data[0]['SkyStoneBonus'] as int) *8;
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
          child: Column(children:<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Column(children: <Widget>[
                Text('Autonomus'),
                Text(autoData.toString()),
              ],),
              Column(children: <Widget>[
                Text('Autonomus'),
                Text(autoData.toString()),
              ],),
              Column(children: <Widget>[
                Text('Autonomus'),
                Text(autoData.toString()),
              ],)
            ],)
          ])
      );
  }
}