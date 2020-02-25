import 'package:flutter/material.dart';
import './build_auto.dart';
import './build_endgame.dart';
import './build_teleop.dart';
class ScoreChanger extends StatelessWidget {
  List<Map<String,Object>>data;
  ScoreChanger(this.data);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx,index) {
        if(index==0) {
          return BuildAuto(data[index]);
        
        } else if(index==1) {
          return  BuildTeleop();
        } else if(index==2) {
          return BuildEndGame();
        }
      } ,
      itemCount: 3,
      );
  }
}