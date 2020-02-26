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
    return Card(child: Text('data'));
  }
}