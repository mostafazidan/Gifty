import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gridview/Screens/gridView.dart'
;import '../service.dart';


// ignore: camel_case_types, must_be_immutable
class load extends StatefulWidget {
  load({this.answer,this.categories}) ;
  List answer ;
  final List categories ;
  @override
  _loadState createState() => _loadState();
}

// ignore: camel_case_types
class _loadState extends State<load> {
  // ignore: non_constant_identifier_names
  GetData() async{
    services s = new services();
    var LoadedData ;
    if(widget.categories.isNotEmpty){
      LoadedData = await s.browseTheCategories(widget.categories);
    }else{
      LoadedData = await s.all(widget.answer);
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GiftScreen(productFromQuestion: LoadedData,answers: widget.answer,categories: widget.categories, )));
  }
  services s = new services();
  @override
  void initState() {
    super.initState();
    GetData();
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
                "Searching for your gift",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              Text(
                "Please wait...",
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
