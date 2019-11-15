import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/widgets/tournamentCardsWdiget/invitation_card.dart';
class Invitationn extends StatelessWidget {

  var tr;
  Invitationn(this.tr); 
  @override 
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,

          child: Column(
            children: <Widget>[
              
              InvitationCard(tr),
             
            ],
          ),
        ),
      ),
    );
  }
}
