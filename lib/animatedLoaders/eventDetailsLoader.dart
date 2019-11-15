import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventDetailsLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
                  child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                
                
                Container(
                  //margin: EdgeInsets.only(top: 15),
                  child: Column(
                    children: <Widget>[
                      Card1(),
                      Card2(),
                      Card3(),
                      Card4()
                      ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}







class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 270,
        padding: EdgeInsets.only(left: 20, right: 40, top: 80, bottom: 25),
        margin: EdgeInsets.only(bottom: 5),
        color: Colors.white.withOpacity(0.2),
            );
  }
}





class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
                  height: 83,
                  width: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                        child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 15,
                      width: 30,
                    ),
                  ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 15,
                      width: 50,
                    ),
                  ),
                      )
                          ],
                        ),
                      ),

                      Container(
                        child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 13,
                      width: 50,
                    ),
                  ),
                      )
                    ],
                  ),
                ),

          Container(
                  //width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15),
                  height: 83,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 20,
                      width: 150,
                    ),
                  ),
                      ),

                      Container(
                        child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 17,
                      width: 120,
                    ),
                  ),
                      ),
                    ],
                  )
                ),
        ],
      ),
    );
  }
}




class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              padding: EdgeInsets.only( top: 15, bottom: 20, left: 10),
              margin: EdgeInsets.only(bottom: 10,left: 20, right: 20,),
              decoration: BoxDecoration(
                //color: Colors.white.withOpacity(0.2),
                border: BorderDirectional(
                  bottom: BorderSide(color: Colors.grey, width: 0.5)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      
                      children: <Widget>[
                        Container(
                                    height: 60,
                                    //color: Colors.blue,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 82,
                                      child: Stack(
                                        children: <Widget>[
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[700],
                                            highlightColor: Colors.grey[600],
                                            child: ClipOval(
                                                child: Container(
                                              height: 32,
                                              width: 32,
                                              color: Colors.black,
                                            )),
                                          ),
                                          Positioned(
                                            left: 25,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[700],
                                              highlightColor: Colors.grey[600],
                                              child: ClipOval(
                                                  child: Container(
                                                height: 32,
                                                width: 32,
                                                color: Colors.black,
                                              )),
                                            ),
                                          ),
                                          Positioned(
                                            left: 50,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[700],
                                              highlightColor: Colors.grey[600],
                                              child: ClipOval(
                                                  child: Container(
                                                height: 32,
                                                width: 32,
                                                color: Colors.black,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                      ),

                        Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: 120,
                          ),
                        ),
                            ),
                      ],
                    ),
                  ),


                  Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Shimmer.fromColors(
                              baseColor: Colors.grey[700],
                              highlightColor: Colors.grey[600],
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black,
                                ),
                                height: 15,
                                width: 30,
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),

            );
  }
}


class Card4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              //color: Colors.red,
              //padding: EdgeInsets.only( top: 15, bottom: 20, left: 10),
              margin: EdgeInsets.only(bottom: 10,left: 20, right: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                            ),

                            Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                            ),


                            Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                            ),

                            Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                            ),


                            Container(
                              child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            height: 17,
                            width: 200,
                          ),
                        ),
                            ),
                ],
              )

            );
  }
}

 