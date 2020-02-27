import 'package:flutter/material.dart';

class BuildTeleop extends StatefulWidget {
  Map<String, Object> data;
  Function increaseStonesPlacedTeleop;
  Function decreaseStonesPlacedTeleop;
  Function increaseStonesDeliveredTeleop;
  Function decreaseStonesDeliveredTeleop;
  Function increaseSkyScraperHeight;
  Function decreaseSkyScraperHeight;
  BuildTeleop(this.data,
      {
      @required this.decreaseSkyScraperHeight,
      @required this.decreaseStonesDeliveredTeleop,
      @required this.decreaseStonesPlacedTeleop,
      @required this.increaseSkyScraperHeight,
      @required this.increaseStonesDeliveredTeleop,
      @required this.increaseStonesPlacedTeleop,
      
      });
  @override
  _BuildTeleopState createState() => _BuildTeleopState();
}

class _BuildTeleopState extends State<BuildTeleop> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        children:<Widget>[
          Text('Tele-OP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange,
          ),),
          Row(
            
            children: <Widget>[
            SizedBox(width:13),
            Text('Stones delivered: '),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              IconButton(
              icon: Icon(Icons.remove),
              color: Colors.orange,
               onPressed: () {
                 widget.decreaseStonesDeliveredTeleop();
               },
            ),
            Text(widget.data['StonesDelivered'].toString()),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.orange,
               onPressed: () {
                 widget.increaseStonesDeliveredTeleop();
               },
            ),
            ],)
          ],),
          Row(
            
            children:<Widget>[
              SizedBox(width:13),
              Text('Stones placed: '),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                IconButton(
              icon: Icon(Icons.remove),
              color: Colors.orange,
               onPressed: () {
                 widget.decreaseStonesPlacedTeleop();
               },
            ),
            Text(widget.data['StonesPlaced'].toString()),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.orange,
               onPressed: () {
                 widget.increaseStonesPlacedTeleop();
               },
            ),
              ],)
            ]),
            Row(
            
            children:<Widget>[
              SizedBox(width:13),
              Text('Skyscraper height: '),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                IconButton(
              icon: Icon(Icons.remove),
              color: Colors.orange,
               onPressed: () {
                 widget.decreaseSkyScraperHeight();
               },
            ),
            Text(widget.data['SkyScraperHeight'].toString()),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.orange,
               onPressed: () {
                 widget.increaseSkyScraperHeight();
               },
            ),
              ],)
              
            ]),
      ]),
    );
  }
}