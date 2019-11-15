import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/widgets/tournamentCardsWdiget/running_cards.dart';
import 'package:padelmatchv2/screens/widgets/tournamentCardsWdiget/sptCard.dart';


class SvenskaPadelTouren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.only(left: 60.0, top: 70.0, right: 60.0),

          child: Column(
            children: <Widget>[
              SPTCard(),
              SPTCard2(),
              SPTCard3(),
              SPTCard4(),
              SPTCard5(),
              SPTCard6(),
            ],
          ),
        ),
      ),
    );
  }
} 