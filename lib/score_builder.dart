import 'package:flutter/material.dart';
import './build_auto.dart';
import './build_endgame.dart';
import './build_teleop.dart';

class ScoreChanger extends StatelessWidget {
  List<Map<String, Object>> data;
  Function updateFirstBot;
  Function updateFundation;
  Function updateSecondBot;
  Function decreaseStonesDelivered;
  Function increaseStonesDelivered;
  Function decreaseStonesPlaced;
  Function increaseStonesPlaced;
  Function decreaseSkystoneBonus;
  Function increaseSkystoneBonus;
  ScoreChanger(this.data,
      {@required this.updateFirstBot,
      @required this.updateFundation,
      @required this.decreaseSkystoneBonus,
      @required this.decreaseStonesDelivered,
      @required this.decreaseStonesPlaced,
      @required this.increaseSkystoneBonus,
      @required this.increaseStonesDelivered,
      @required this.increaseStonesPlaced,
      @required this.updateSecondBot});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        if (index == 0) {
          return BuildAuto(
            data[index],
            updateFirstBot: updateFirstBot,
            updateSecondBot: updateSecondBot,
            updateFundation: updateFundation,
            increaseSkystoneBonus: increaseSkystoneBonus,
            increaseStonesDelivered: increaseStonesDelivered,
            increaseStonesPlaced: increaseStonesPlaced,
            decreaseSkystoneBonus: decreaseSkystoneBonus,
            decreaseStonesDelivered: decreaseStonesDelivered,
            decreaseStonesPlaced: decreaseStonesPlaced,
          );
        } else if (index == 1) {
          return BuildTeleop();
        } else if (index == 2) {
          return BuildEndGame();
        }
      },
      itemCount: 3,
    );
  }
}
