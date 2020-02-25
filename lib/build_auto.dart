import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuildAuto extends StatefulWidget {
  Map<String, Object> data;
  BuildAuto(this.data);
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
              color: Theme.of(context).accentColor,
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 13),
              Text('Fundation moved: '),
              Switch.adaptive(
                  value: widget.data['Fundation'],
                  onChanged: (val) {
                    setState(() {
                      widget.data['Fundation'] = val;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Parked Robots: '),
              FlatButton(
                onPressed: () {
                  setState(() {
                    widget.data['ParkedBots1'] = !widget.data['ParkedBots1'];
                  });
                },
                child: Text('First bot'),
                color: widget.data['ParkedBots1']
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    widget.data['ParkedBots2'] = !widget.data['ParkedBots2'];
                  });
                },
                child: Text('Second bot'),
                color: widget.data['ParkedBots2']
                    ? Theme.of(context).accentColor
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
                      icon: Icon(Icons.arrow_downward),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        setState(() {
                          int x = widget.data['StonesDelivered'];
                          if (x > 0) {
                            widget.data['StonesDelivered'] =
                                (widget.data['StonesDelivered'] as int) - 1;
                            x = widget.data['StonesDelivered'];
                            final int y = widget.data['StonesPlaced'];
                            if (x < y) {
                              widget.data['StonesPlaced'] =
                                  (widget.data['StonesPlaced'] as int) - 1;
                            }
                          }
                        });
                      }),
                  Text(widget.data['StonesDelivered'].toString()),
                  IconButton(
                      color: Theme.of(context).accentColor,
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        setState(() {
                          widget.data['StonesDelivered'] =
                              (widget.data['StonesDelivered'] as int) + 1;
                        });
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
                      color: Theme.of(context).accentColor,
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          int x = widget.data['StonesPlaced'];
                          if (x > 0) {
                            widget.data['StonesPlaced'] =
                                (widget.data['StonesPlaced'] as int) - 1;
                            x = widget.data['StonesDelivered'] as int;
                            final int y = widget.data['StonesPlaced'] as int;
                            if ((x < y))
                              widget.data['StonesDelivered'] =
                                  (widget.data['StonesDelivered'] as int) - 1;
                          }
                        });
                      }),
                  Text(widget.data['StonesPlaced'].toString()),
                  IconButton(
                      color: Theme.of(context).accentColor,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          widget.data['StonesPlaced'] =
                              (widget.data['StonesPlaced'] as int) + 1;
                          final int x = widget.data['StonesDelivered'] as int;
                          final int y = widget.data['StonesPlaced'] as int;
                          if (x < y)
                            widget.data['StonesDelivered'] =
                                (widget.data['StonesDelivered'] as int) + 1;
                        });
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
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        setState(() {
                          final int x = widget.data['SkyStoneBonus'];
                          if (x > 0)
                            widget.data['SkyStoneBonus'] =
                                (widget.data['SkyStoneBonus'] as int) - 1;
                        });
                      }),
                  Text(widget.data['SkyStoneBonus'].toString()),
                  IconButton(
                      icon: Icon(Icons.add),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        setState(() {
                          final int x = widget.data['SkyStoneBonus'];
                          if (x < 2)
                            widget.data['SkyStoneBonus'] =
                                (widget.data['SkyStoneBonus'] as int) + 1;
                        });
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
