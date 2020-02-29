import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuildAuto extends StatefulWidget {
  Map<String, Object> data;
  Function updateFirstBot;
  Function updateFundation;
  Function updateSecondBot;
  Function decreaseStonesDelivered;
  Function increaseStonesDelivered;
  Function decreaseStonesPlaced;
  Function increaseStonesPlaced;
  Function decreaseSkystoneBonus;
  Function increaseSkystoneBonus;
  
  BuildAuto(this.data,
      {
      @required  this.updateFirstBot,
      @required this.updateFundation,
      @required this.decreaseSkystoneBonus,
      @required this.decreaseStonesDelivered,
      @required this.decreaseStonesPlaced,
      @required this.increaseSkystoneBonus,
      @required this.increaseStonesDelivered,
      @required this.increaseStonesPlaced,
      @required this.updateSecondBot,
      });
  @override
  _BuildAutoState createState() => _BuildAutoState();
}

class _BuildAutoState extends State<BuildAuto> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            'Autonomus Period',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 13),
              Text('Fundation moved: '),
              Switch.adaptive(
                  value: widget.data['Fundation'],
                  onChanged: (val) {
                    widget.updateFundation(val);
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Parked Robots: '),
              FlatButton(
                onPressed: () {
                  widget.updateFirstBot();
                },
                child: Text('First bot'),
                color: widget.data['ParkedBots1']
                    ? Colors.green
                    : Colors.grey,
              ),
              FlatButton(
                onPressed: () {
                  widget.updateSecondBot();
                },
                child: Text('Second bot'),
                color: widget.data['ParkedBots2']
                    ? Colors.green
                    : Colors.grey,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Stones Delivered:'),
                  IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.green,
                      onPressed: () {
                        widget.decreaseStonesDelivered();
                      }),
                  Text(widget.data['StonesDelivered'].toString()),
                  IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        widget.increaseStonesDelivered();
                      }),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 13),
              Text("Sones Placed:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        widget.decreaseStonesPlaced();
                      }),
                  Text(widget.data['StonesPlaced'].toString()),
                  IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        widget.increaseStonesPlaced();
                      })
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 13),
              Text('SkyStone Bonus:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.green,
                      onPressed: () {
                        widget.decreaseSkystoneBonus();
                      }),
                  Text(widget.data['SkyStoneBonus'].toString()),
                  IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.green,
                      onPressed: () {
                        widget.increaseSkystoneBonus();
                      }),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
