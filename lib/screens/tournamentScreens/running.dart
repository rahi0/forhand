import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/widgets/tournamentCardsWdiget/running_cards.dart';
class Running extends StatelessWidget {
  
  var tr;
  Running(this.tr);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,

          child: Column(
            children: <Widget>[
              RunningCard(tr),
            ],
          ),
        ),
      ),
    );
  }
}
