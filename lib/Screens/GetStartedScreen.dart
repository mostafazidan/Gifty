import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/components/navbar.dart';
import 'package:gridview/service.dart';
import 'questionsScreen.dart';

// ignore: camel_case_types
class firstScreen extends StatefulWidget {
  @override
  _firstScreenState createState() => _firstScreenState();
}

// ignore: camel_case_types
class _firstScreenState extends State<firstScreen> {
  int _selectedItemIndex = 0;
  services s = new services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/gift.gif'),
            fit: BoxFit.cover,
          )),
          //color: Color.fromRGBO(228, 180, 180, 1),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Divider(
                              thickness: 5,
                              indent: 145,
                              endIndent: 145,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "  Find your\nPerfect Gift",
                              style: TextStyle(
                                color: Color.fromRGBO(228, 180, 180, 1),
                                fontSize: 30,
                                /*fontFamily: 'Ubuntu',*/
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 7, bottom: 7),
                              child: Text(
                                "From our smart app you can find the appropriate gift which we recommend it to you.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // ignore: deprecated_member_use
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()),
                                    );
                                  },
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(228, 180, 180, 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 28, right: 28, top: 7, bottom: 7),
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),

    );
  }



}
