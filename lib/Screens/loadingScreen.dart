import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'GetStartedScreen.dart';

// ignore: camel_case_types
class loadingScreen extends StatefulWidget {
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

// ignore: camel_case_types
class _loadingScreenState extends State<loadingScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),
            ()=>Navigator.push(
            context, MaterialPageRoute(builder: (context)=>firstScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 179, 179, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.black,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10.0),
              ),
              Text(
                "Gift App",
                style: TextStyle(
                    /*fontFamily: 'Pacifico',*/
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 50.0),
              SpinKitThreeBounce(color: Colors.white,
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
