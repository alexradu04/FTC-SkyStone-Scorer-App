import 'package:flutter/material.dart';

class ScoreShower extends StatelessWidget {
  List<Map<String, Object>> data;
  ScoreShower(this.data);
  int get autoData {
    int sum = 0;
    if (data[0]['Fundation']) sum += 10;
    if (data[0]['ParkedBots1']) sum += 5;
    if (data[0]['ParkedBots2']) sum += 5;
    sum += (data[0]['StonesDelivered'] as int) * 2;
    sum += (data[0]['StonesPlaced'] as int) * 4;
    sum += (data[0]['SkyStoneBonus'] as int) * 8;
    return sum;
  }
  int get teleopData {
    int sum=0;
    sum+=data[1]['StonesDelivered'] as int;
    sum+=data[1]['StonesPlaced'] as int;
    sum+=(data[1]['SkyScraperHeight'] as int) *2;
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Autonomus',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        ),),
                  Text(
                    autoData.toString(),
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('Tele-OP',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        ),),
                  Text(
                    teleopData.toString(),
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('EndGame',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        ),),
                  Text(
                    autoData.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        ),
                  ),
                ],
              )
            ],
          ),
          Column(children:<Widget>[
            Text('Total',style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            Text('125',style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
          ])
        ]));
  }
}
