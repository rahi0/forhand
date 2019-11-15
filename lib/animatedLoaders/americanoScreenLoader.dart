import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AmericanoScreenLoader extends StatelessWidget {
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
                      Card3(),
                      Card3(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: 10,),

                Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                             // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Shimmer.fromColors(
                                        baseColor: Colors.grey[700],
                                        highlightColor: Colors.grey[600],
                                        child: Container(
                                          height: 20,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[800]),
                                        ),
                                      ),
                                        ),

                                        Container(
                                           margin: EdgeInsets.only(bottom: 15),
                                          child: Shimmer.fromColors(
                                        baseColor: Colors.grey[700],
                                        highlightColor: Colors.grey[600],
                                        child: Container(
                                          height: 15,
                                          width: 87,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[800]),
                                        ),
                                      ),
                                        ),


                                        Container(
                                          child: Shimmer.fromColors(
                                        baseColor: Colors.grey[700],
                                        highlightColor: Colors.grey[600],
                                        child: Container(
                                          height: 14,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[800]),
                                        ),
                                      ),
                                        ),
                                      ],
                                    ),
                                  ),
                                
                                  Container(
                                    child: Shimmer.fromColors(
                                baseColor: Colors.grey[700],
                                highlightColor: Colors.grey[600],
                                child: ClipOval(
                                    child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.black,
                                )),
                              ),
                                  )
                                ],
                              ),

                            ),

                Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.blue,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 60,
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
                                  ],
                                ),
                              ),
                )
              ],
            ),
            );
  }
}





class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
                  height: 50,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 27,
                      width: 80,
                    ),
                  ),
                ),

          Container(
                  //width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      height: 27,
                      width: 120,
                    ),
                  ),
                ),

                Container(
                  height: 50,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      height: 27,
                      width: 40,
                    ),
                  ),
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
              height: 225,
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 20),
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        
/////////////
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.only(right: 10),
                                child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                                            child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                    ),

                          ),
                        ),
                              ),
                        Container(
                          //width: 80,
                          //color: Colors.red,
                          child: Shimmer.fromColors(
                                baseColor: Colors.grey[700],
                                highlightColor: Colors.grey[600],
                                                        child: ClipOval(
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    color: Colors.black,
                                  )),
                              ),
                        ),

                        
                      ],
                    ),
                  ),

                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.only(right: 10),
                                child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                                            child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                    ),

                          ),
                        ),
                              ),
                        Container(
                          //width: 80,
                          //color: Colors.red,
                          child: Shimmer.fromColors(
                                baseColor: Colors.grey[700],
                                highlightColor: Colors.grey[600],
                                                        child: ClipOval(
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    color: Colors.black,
                                  )),
                              ),
                        ),

                        
                      ],
                    ),
                  ),
                            ],
                          ),
                        ),
/////////////////////
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                                            child: Container(
                            height: 20,
                            width: 25,
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                    ),

                          ),
                        ),
                        ),



/////////////
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[

                        Container(
                          //width: 80,
                          //color: Colors.red,
                          child: Shimmer.fromColors(
                                baseColor: Colors.grey[700],
                                highlightColor: Colors.grey[600],
                                                        child: ClipOval(
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    color: Colors.black,
                                  )),
                              ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),
                                child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                                            child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                    ),

                          ),
                        ),
                              ),

                        
                      ],
                    ),
                  ),

                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[

                        Container(
                          //width: 80,
                          //color: Colors.red,
                          child: Shimmer.fromColors(
                                baseColor: Colors.grey[700],
                                highlightColor: Colors.grey[600],
                                                        child: ClipOval(
                                  child: Container(
                                    height: 42,
                                    width: 42,
                                    color: Colors.black,
                                  )),
                              ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),
                                child: Shimmer.fromColors(
                          baseColor: Colors.grey[700],
                          highlightColor: Colors.grey[600],
                                            child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                    ),

                          ),
                        ),
                              ),

                        
                      ],
                    ),
                  ),
                            ],
                          ),
                        ),
/////////////////////
                        

                      ],
                    ),
                  ),

                  Container(
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      height: 20,
                      width: 150,
                      
                    ),
                  ),
                  ),
                      ],
                    ),
                  ),

                  Container(
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      width: 60,
                      
                    ),
                  ),
                  ),
                      ],
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 0, bottom: 0),
                   width: MediaQuery.of(context).size.width,
                   height: 0.5,
                   color: Colors.grey[400],
                  ),



                  Container(
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      width: 90,
                      
                    ),
                  ),
                  ),
                      ],
                    ),
                  ),
                ],
              )
            );
  }
}

 