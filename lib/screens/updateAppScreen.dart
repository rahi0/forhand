import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
class UpdateAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Center(
            child: Text(FlutterI18n.translate(context, "Please update your app")),
          ),
        ),
    );
  }
}