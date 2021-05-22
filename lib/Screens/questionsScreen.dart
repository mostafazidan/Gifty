import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gridview/service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'gridView.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 340,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    child: Text(
                      "What is your step?",
                      style: TextStyle(
                        color: Color(0xFFBF8989),
                        fontSize: 24,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 50),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 35, 30, 20),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color(0xFFE4B4B4),
                    groupValue: radioItem,
                    title: Text('Make a recommendation'),
                    value: 'Item 1',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 30, 0),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color(0xFFE4B4B4),
                    groupValue: radioItem,
                    title: Text('Browse the categories'),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {

                      if(radioItem =='Item 2'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GiftScreen()),
                        );
                      }
                      else if(radioItem == 'Item 1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyNextPage()),
                        );
                      }
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyNextPage extends StatefulWidget {
  MyNextPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  int currentValue = 16;
  double value = 500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 400,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                          color: Color(0xFFBF8989),
                          fontSize: 24,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Slider(
                    value: value,
                    min: 0.0,
                    max: 1500.0,
                    divisions: 100,
                    label: "$value",
                    activeColor: Color(0xFFBF8989),
                    inactiveColor: Color(0xFFEEEEEE),
                    onChanged: (newRating) {
                      setState(() => value = newRating.roundToDouble());
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30),
                  child: Row(
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                          color: Color(0xFFBF8989),
                          fontSize: 24,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: Color(0xFFBF8989),
                      //     style: BorderStyle.solid,
                      //   ),
                      // ),
                      child: NumberPicker(
                        value: currentValue,
                        minValue: 1,
                        maxValue: 50,
                        selectedTextStyle: TextStyle(color: Color(0xFFBF8989)),
                        onChanged: (newValue) {
                          setState(() => currentValue = newValue);
                        },
                        decoration: BoxDecoration(
                          border: new Border(
                            top: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black26,
                            ),
                            bottom: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage(age:currentValue,price: value,)),
                      );
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyQuestionPage extends StatefulWidget {
  MyQuestionPage({Key key, this.age,this.title, this.price}) : super(key: key);
  final double price ;
  final String title;
  final int age;

  @override
  _MyQuestionPage createState() => _MyQuestionPage();
}

class _MyQuestionPage extends State<MyQuestionPage> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    if (widget.age > 21) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gift.gif'),
                fit: BoxFit.cover,
              )),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 370,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What does he/she mean to you?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          looping: true,
                          onSelectedItemChanged: (int index) {},
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Father",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Mother",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),

                            Center(
                              child: Text(
                                "Friend",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Brother",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Sister",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Son",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFFBF8989),
                      //0xFFBF8989 CEAEAF E4B4B4
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      onPressed: () =>
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyQuestionPage2(age: widget.age,price: widget.price,)),
                            );
                          }),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    }
    else{
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gift.gif'),
                fit: BoxFit.cover,
              )),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 370,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What does he/she mean to you?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          looping: true,
                          onSelectedItemChanged: (int index) {},
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Friend",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Brother",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Sister",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Son",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFFBF8989),
                      //0xFFBF8989 CEAEAF E4B4B4
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      onPressed: () =>
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyQuestionPage2(age: widget.age,price: widget.price,)),
                            );
                          }),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    }
  }
}

class MyQuestionPage2 extends StatefulWidget {
  MyQuestionPage2({Key key,this.age,this.price, this.title}) : super(key: key);
  final double price;
  final String title;
  final int age;

  @override
  _MyQuestionPage2 createState() => _MyQuestionPage2();
}

class _MyQuestionPage2 extends State<MyQuestionPage2> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    if (widget.age > 18 && widget.age < 25) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gift.gif'),
                fit: BoxFit.cover,
              )),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 370,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What is the gift occasion?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          looping: true,
                          onSelectedItemChanged: (int index) {},
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Birthday",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Anniversary",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Graduation",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Achievement",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Wedding",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFFBF8989),
                      //0xFFBF8989 CEAEAF E4B4B4
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      onPressed: () =>
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyQuestionPage3(age :widget.age ,price: widget.price, )),
                            );
                          }),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    } //end if
    else if (widget.age < 18) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gift.gif'),
                fit: BoxFit.cover,
              )),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 370,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What is the gift occasion?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          looping: true,
                          onSelectedItemChanged: (int index) {},
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Birthday",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Graduation",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Achievement",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFFBF8989),
                      //0xFFBF8989 CEAEAF E4B4B4
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      onPressed: () =>
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyQuestionPage3(age: widget.age,price: widget.price,)),
                            );
                          }),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    }
    // end else if
    else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gift.gif'),
                fit: BoxFit.cover,
              )),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: 370,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "What is the gift occasion?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 50,
                          looping: true,
                          onSelectedItemChanged: (int index) {},
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Birthday",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Anniversary",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Achievement",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Wedding",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBF8989),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      onPressed: () => setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyQuestionPage3(age: widget.age,price: widget.price,)),
                        );
                      }),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    }
  }
}

class Interest {
  final int id;
  final String name;

  Interest({
    this.id,
    this.name,
  });
}

class MyQuestionPage3 extends StatefulWidget {
  MyQuestionPage3({Key key,this.age,this.price, this.title=''}) : super(key: key);

  final String title;
  final int age;
  final double price;

  @override
  _MyQuestionPage3 createState() => _MyQuestionPage3();
}

class _MyQuestionPage3 extends State<MyQuestionPage3> {
  static List<Interest> _interest = [
    Interest(id: 1, name: "Sport"),
    Interest(id: 2, name: "Reading"),
    Interest(id: 3, name: "Watch Movies"),
    Interest(id: 4, name: "Arts & Painting"),
    Interest(id: 5, name: "Kitchen & Cooking"),
    Interest(id: 6, name: "Swimming"),
    Interest(id: 7, name: "Fishing"),
    Interest(id: 8, name: "Music"),
  ];
  final _items = _interest
      .map((interest) => MultiSelectItem<Interest>(interest, interest.name))
      .toList();
  List<Interest> _selectedinterest = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 600,
        decoration: BoxDecoration(
          color: Color.fromRGBO(228, 180, 180, 1),
        ),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    MultiSelectBottomSheetField<Interest>(
                      key: _multiSelectKey,
                      initialChildSize: 0.7,
                      maxChildSize: 0.95,
                      title: Text("Interests"),
                      buttonText: Text("Favorite Interests"),
                      items: _items,
                      searchable: true,
                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      onConfirm: (values) {
                        setState(() {
                          _selectedinterest = values;
                        });
                        _multiSelectKey.currentState.validate();
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (item) {
                          setState(() {
                            _selectedinterest.remove(item);
                          });
                          _multiSelectKey.currentState.validate();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Center(
        child: Container(
          margin: EdgeInsets.only(top: 300),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color(0xFFBF8989),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            onPressed: ()  async{
              if(_selectedinterest.isEmpty){
                return _MyQuestionPage3();
              }else {
                //Loading Data
                print("Loooding");
                services s = new services();
                var answer = new List();
                answer.add(widget.age);
                answer.add(widget.price);
                answer.add(_selectedinterest);
                var l = [10 , 20,"Toys & Games ", "Automotive "];
                var LoadedData = await s.all(l);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GiftScreen(productFromQuestion: LoadedData,)),
                );
              }
            },
            child: Text(
              "search".toUpperCase(),
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}