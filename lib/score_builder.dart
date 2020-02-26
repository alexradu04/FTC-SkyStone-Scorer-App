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
  Function increaseStonesPlacedTeleop;
  Function decreaseStonesPlacedTeleop;
  Function increaseStonesDeliveredTeleop;
  Function decreaseStonesDeliveredTeleop;
  Function increaseSkyScraperHeight;
  Function decreaseSkyScraperHeight;
  ScoreChanger(this.data,
      {@required this.updateFirstBot,
      @required this.updateFundation,
      @required this.decreaseSkystoneBonus,
      @required this.decreaseStonesDelivered,
      @required this.decreaseStonesPlaced,
      @required this.increaseSkystoneBonus,
      @required this.increaseStonesDelivered,
      @required this.increaseStonesPlaced,
      @required this.updateSecondBot,
      @required this.decreaseSkyScraperHeight,
      @required this.decreaseStonesDeliveredTeleop,
      @required this.decreaseStonesPlacedTeleop,
      @required this.increaseSkyScraperHeight,
      @required this.increaseStonesDeliveredTeleop,
      @required this.increaseStonesPlacedTeleop,
      
      });
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
          return BuildTeleop(
            data[index],
             decreaseSkyScraperHeight: decreaseSkyScraperHeight,
             decreaseStonesDeliveredTeleop: decreaseStonesDeliveredTeleop,
             decreaseStonesPlacedTeleop :decreaseStonesPlacedTeleop,
             increaseSkyScraperHeight: increaseSkyScraperHeight,
             increaseStonesDeliveredTeleop:increaseStonesDeliveredTeleop,
             increaseStonesPlacedTeleop : increaseStonesPlacedTeleop,

          );
        } else if (index == 2) {
          return BuildEndGame();
        }
      },
      itemCount: 3,
    );
  }
}
