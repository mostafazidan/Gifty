import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gridview/Screens/ProductDetailsScreen.dart';


// ignore: camel_case_types
class load extends StatefulWidget {
  @override
  _loadState createState() => _loadState();
}

// ignore: camel_case_types
class _loadState extends State<load> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds:10),
            ()=>Navigator.push(
            context, MaterialPageRoute(builder: (context)=>ProductScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 180, 180, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitFadingCircle(color: Colors.white,
                size: 50.0,
              ),
              SizedBox(height: 30),
              Text(
                "Please Wait...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
