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
  Function assistTrigger;
  Function moveFoundationEndGame;
  Function parkFirstBot;
  Function parkSecondBot;
  Function updateCapstoneNumber;
  Function assistTriggerCap1;
  Function decreaseCap1;
  Function increaseCap1;
  Function decreaseCap2;
  Function increaseCap2;
  bool triggerCap1;
  bool trigger;
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
      @required this.assistTrigger,
      @required this.trigger,
      @required this.moveFoundationEndGame,
      @required this.parkFirstBot,
      @required this.parkSecondBot,
      @required this.updateCapstoneNumber,
      @required this.increaseCap1,
      @required this.decreaseCap1,
      @required this.assistTriggerCap1,
      @required this.triggerCap1,
      @required this.decreaseCap2,
      @required this.increaseCap2,
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
             assistTrigger: assistTrigger,
             
            trigger: trigger,

          );
        } else if (index == 2) {
          return BuildEndGame(
            data[index],
            moveFoundationEndGame: moveFoundationEndGame,
            parkFirstBot: parkFirstBot,
            parkSecondBot: parkSecondBot,
            updateCapstoneNumber: updateCapstoneNumber,
            assistTriggerCap1: assistTriggerCap1,
            decreaseCap1: decreaseCap1,
            increaseCap1: increaseCap1,
            triggerCap1: triggerCap1,
            decreaseCap2: decreaseCap2,
            increaseCap2: increaseCap2,
          );
        }
      },
      itemCount: 3,
    );
  }
}
