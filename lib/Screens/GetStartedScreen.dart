import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
     /* bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0, true),
          buildNavBarItem(Icons.search, 1, false),
          buildNavBarItem(Icons.inbox, 2, false),
          buildNavBarItem(Icons.archive, 3, false),
          buildNavBarItem(Icons.settings, 4, false),
        ],
      ),*/
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
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "From our smart app you can find\nthe appropriate gift which we\nrecommend it to you.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 21,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                              onPressed: () async {

                                // var l = [10 , 20,"Pet Supplies ", "Automotive "];
                                // var x = await s.all(l);
                                // print(x[1]);

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
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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

/*
  Widget buildNavBarItem(IconData icon, int index, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 4, color: Color.fromRGBO(228, 180, 180, 1)),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(228, 180, 180, 0.3),
                    Color.fromRGBO(228, 180, 180, 0.015),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ))
            : BoxDecoration(),
        child: Icon(icon,
            color: index == _selectedItemIndex ? Colors.black : Colors.grey),
      ),
    );
  }
*/
}
