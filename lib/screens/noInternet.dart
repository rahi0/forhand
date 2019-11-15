import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ],
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset('assets/img/no_internet.png')
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(FlutterI18n.translate(context, "No Internet Connection"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                      fontSize: 20, color: Colors.grey[900])))
                        ],
                      ),
                    );
  }
}