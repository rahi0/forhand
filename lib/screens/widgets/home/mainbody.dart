import 'package:flutter/material.dart';
import 'package:padelmatchv2/customFakeCards/bookingCard.dart';
import 'package:padelmatchv2/customFakeCards/practiceCard.dart';
import 'package:padelmatchv2/screens/widgets/home/UpcomeingEventCard.dart';
import 'package:padelmatchv2/screens/widgets/home/current_stand.dart';
import 'package:padelmatchv2/screens/widgets/home/upcomeingAmericanoCard.dart';
import 'package:padelmatchv2/screens/widgets/home/upcomingmatchescard.dart';

class MainBody extends StatelessWidget {
  final data;
  MainBody(this.data);
  @override
  Widget build(BuildContext context) { 
    return  Container(
      child: CustomScrollView( 
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                 return CurrentStand(data.currentDivs, index);
              },
              
              childCount: data.currentDivs.length,
            ),
          ),

          ////////fake Cards start//////////

          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //        return BookingCard();
          //     },
              
          //     childCount: 1,
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //        return PracticeCard();
          //     },
              
          //     childCount: 1,
          //   ),
          // ),

          ////////fake Cards End//////////
          


          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                 
                 if(data.matches[index].cardType=='division'){
                   return UpcomingMatchesCard(data.matches, index);
                 }
                 if(data.matches[index].cardType=='event'){
                    print(data.matches[index].singedupCount);
                    return UpcomingEventCard(data.matches, index);
                 }
                 if(data.matches[index].cardType=='americano'){
                    return UpcomingAmericanoCard(data.matches, index);
                 }
                
                 
              },
              // Or, uncomment the following line:
              childCount: data.matches.length,
            ),
          ),
        ],
      ),
      //     child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      // children: <Widget>[

      //   //////////////// GestureDetector Start///////////////////

      //            Container(
      //         child: Flexible(
      //           child: ListView.builder(
      //               //shrinkWrap: true,
      //               itemCount: data.matches.length-52,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return Container(
      //                   child: CurrentStand(),
      //                 );
      //               }),
      //         ),
      //           ),

      //   //////////////// GestureDetector end///////////////////
      //   ///
      //   Container(
      //         child: Expanded(
      //           child: ListView.builder(
      //               shrinkWrap: true,
      //               itemCount: data.matches.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return Container(
      //                   child: UpcomingMatchesCard(data.matches, index),
      //                 );
      //               }),
      //         ),
      //           )
      // ],
      //     ),
    );
  }
}
