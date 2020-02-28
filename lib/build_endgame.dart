
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class BuildEndGame extends StatefulWidget {
  final Map<String, Object> data;
  Function moveFoundationEndGame;
  Function parkFirstBot;
  Function parkSecondBot;
  Function updateCapstoneNumber;
  bool triggerCap1;
  Function increaseCap1;
  Function decreaseCap1;
  Function assistTriggerCap1;
  Function decreaseCap2;
  Function increaseCap2;
  BuildEndGame(this.data,{
    @required this.moveFoundationEndGame,
    @required this.parkFirstBot,
    @required this.parkSecondBot,
    @required this.updateCapstoneNumber,
    @required this.triggerCap1,
    @required this.assistTriggerCap1,
    @required this.decreaseCap1,
    @required this.increaseCap1,
    @required this.decreaseCap2,
    @required this.increaseCap2,
    });
  @override
  _BuildEndGameState createState() => _BuildEndGameState();
}

class _BuildEndGameState extends State<BuildEndGame> {
  int get numberOfCapstones {
    if((widget.data['CapstoneNumber']as double)<1.0) {
      return 0;
    }
    if((widget.data['CapstoneNumber']as double)<2.0) {
      return 1;
    }
    else {
      return 2;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
      Text(
        'EndGame',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.red,
        ),
      ),
        Row(
          
          children: <Widget>[
          

          SizedBox(width:13),
          Text('Foudation moved: '),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              Switch.adaptive(
                value: widget.data['Foundation'],
                 onChanged: (val) {
                    widget.moveFoundationEndGame(val);
                 },
                 activeColor: Colors.red,
                )
            ]
          ),
          
        ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Parked Robots: '),
              FlatButton(
                onPressed: () {
                  widget.parkFirstBot();
                },
                child: Text('First bot'),
                color: widget.data['ParkedBots1']
                    ? Colors.red
                    : Colors.grey,
              ),
              FlatButton(
                onPressed: () {
                  widget.parkSecondBot();
                },
                child: Text('Second bot'),
                color: widget.data['ParkedBots2']
                    ? Colors.red
                    : Colors.grey,
              ),
            ],
          ),
        Row(children: <Widget>[
          SizedBox(width:13),
          Text('Capstones: '),
          Slider(
            value: widget.data['CapstoneNumber'],
            onChanged: (val) {
              widget.updateCapstoneNumber(val);
              },
            //materialTapTargetSize: MaterialTapTargetSize.padded,
            min:0.0,
            max:2.0,
            divisions: 2,
            label: widget.data['CapstoneNumber'].toString(),
            )          
        ],),
        if(numberOfCapstones>=1)
           Row(
            
            children:<Widget>[
              SizedBox(width:13),
              Text('Capstone #1 height: '),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                IconButton(
              icon: Icon(Icons.remove),
              color: Colors.red,
               onPressed: () {
                 widget.decreaseCap1();
               },
            ),
            Text(widget.data['Capstone1'].toString()),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.red,
               onPressed: () {
                 widget.increaseCap1();
               },
            ),
            RaisedButton(
              child: Text('Assist'),
              color: widget.triggerCap1 ? Colors.red : Colors.grey,
              onPressed: () {
                widget.assistTriggerCap1();
              }
              )
              ],)
              
            ]),

            if(numberOfCapstones>=2)
           Row(
            
            children:<Widget>[
              SizedBox(width:13),
              Text('Capstone #2 height: '),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                IconButton(
              icon: Icon(Icons.remove),
              color: Colors.red,
               onPressed: () {
                 widget.decreaseCap2();
               },
            ),
            Text(widget.data['Capstone2'].toString()),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.red,
               onPressed: () {
                 widget.increaseCap2();
               },
            ),
              ],)
              
            ]),
          
        ])
    );
  }
}
