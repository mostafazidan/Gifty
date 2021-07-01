import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gridview/components/components.dart';
import 'package:gridview/service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'gridView.dart';
import 'load.dart';

// ignore: deprecated_member_use
var answer = new List();

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
                questionHeader(qHeader: "What is your step?"),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 35, 30, 20),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color.fromRGBO(228, 180, 180, 1),
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
                    activeColor: Color.fromRGBO(228, 180, 180, 1),
                    groupValue: radioItem,
                    title: Text('Browse the categories'),
                    value: 'Item 2',
                    //Method
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                nextButtom(
                  onp: ()  {
                    if (radioItem == 'Item 2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage3()),
                      );
                    } else if (radioItem == 'Item 1') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyNextPage()),
                      );
                    }
                  },
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
  MyNextPage({
    Key key,
  }) : super(key: key);

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  int age = 16;
  double price = 500.0;

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
                          color: Color.fromRGBO(228, 180, 180, 1),
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
                    value: price,
                    min: 0.0,
                    max: 1500.0,
                    divisions: 100,
                    label: "$price",
                    activeColor: Color.fromRGBO(228, 180, 180, 1),
                    inactiveColor: Color(0xFFEEEEEE),
                    onChanged: (newRating) {
                      setState(() => price = newRating.roundToDouble());
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
                          color: Color.fromRGBO(228, 180, 180, 1),
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
                      child: NumberPicker(
                        value: age,
                        minValue: 1,
                        maxValue: 50,
                        selectedTextStyle:
                        TextStyle(color: Color.fromRGBO(228, 180, 180, 1)),
                        onChanged: (newValue) {
                          setState(() => age = newValue);
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
                nextButtom(onp: () {
                  answer.add(price);
                  answer.add(age);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyQuestionPage(
                            age: age,
                            price: price,
                            answerOfTheQuestion: answer)),
                  );
                }),
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
  MyQuestionPage({Key key, this.answerOfTheQuestion, this.age, this.price})
      : super(key: key);
  final double price;
  final int age;
  final List answerOfTheQuestion;

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
                  questionHeader(
                    qHeader: "What does he/she mean to you?",
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
                            CenterName(Name: "Father"),
                            CenterName(Name: "Mother"),
                            CenterName(Name: "Friend"),
                            CenterName(Name: "Brother"),
                            CenterName(Name: "Sister"),
                            CenterName(Name: "Son"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  nextButtom(onp: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyQuestionPage2(
                            age: widget.age,
                            price: widget.price,
                          )
                      ),);},
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    } else {
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
                  questionHeader(
                    qHeader: "What does he/she mean to you?",
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
                            CenterName(Name: "Friend"),
                            CenterName(Name: "Brother"),
                            CenterName(Name: "Sister"),
                            CenterName(Name: "Son"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  nextButtom(onp: () async {
                    if (widget.age < 8) {
                      services s = new services();
                      var LoadedData;
                      LoadedData = await s.all(answer);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GiftScreen(
                                  productFromQuestion: LoadedData)));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage2(
                              age: widget.age,
                              price: widget.price,
                            )),
                      );
                    }
                  }
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
  MyQuestionPage2({Key key, this.age, this.answerOfTheQuestion, this.price})
      : super(key: key);
  final double price;
  final int age;
  final List answerOfTheQuestion;

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
                  questionHeader(
                    qHeader: "What is the gift occasion?",
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
                            CenterName(Name: "Birthday"),
                            CenterName(Name: "Graduation"),
                            CenterName(Name: "Anniversary"),
                            CenterName(Name: "Achievement"),
                            CenterName(Name: "Wedding"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  nextButtom(onp:() => setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyQuestionPage3(
                            answerOfTheQuestion:
                            widget.answerOfTheQuestion,
                            age: widget.age,
                            price: widget.price,
                          )),
                    );
                  }),
                  ),
                ],
              ),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
      );
    } //end if
    else if (widget.age < 18 && widget.age > 8) {
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
                  questionHeader(
                    qHeader: "What is the gift occasion?",
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
                            CenterName(Name: "Birthday"),
                            CenterName(Name: "Graduation"),
                            CenterName(Name: "Achievement"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  nextButtom(onp:() => setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyQuestionPage3(
                            answerOfTheQuestion:
                            widget.answerOfTheQuestion,
                            age: widget.age,
                            price: widget.price,
                          )),
                    );
                  }),
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
                  questionHeader(qHeader: "What is the gift occasion?"),
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
                            CenterName(Name: "Birthday"),
                            CenterName(Name: "Achievement"),
                            CenterName(Name: "Anniversary"),
                            CenterName(Name: "Wedding"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  nextButtom(onp: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyQuestionPage3(
                            answerOfTheQuestion: answer,
                            age: widget.age,
                            price: widget.price,
                          )),);},
                  ),
                ],),
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

  @override
  String toString() {
    return "$name";
  }
}

class MyQuestionPage3 extends StatefulWidget {
  MyQuestionPage3(
      {Key key,
        this.answerOfTheQuestion,
        this.age,
        this.categoryies,
        this.price,
        this.title = ''})
      : super(key: key);

  final String title;
  final int age;
  final double price;
  final List categoryies;
  final List answerOfTheQuestion;

  @override
  _MyQuestionPage3 createState() => _MyQuestionPage3();
}

class _MyQuestionPage3 extends State<MyQuestionPage3> {
  static List<Interest> _interest = [
    Interest(id: 1, name: "Toys & Games"),
    Interest(id: 2, name: "Sports & Outdoors"),
    Interest(id: 3, name: "Clothing, Shoes & Jewelry"),
    Interest(id: 4, name: "Electronics"),
    Interest(id: 5, name: "Home & Kitchen"),
    Interest(id: 6, name: "Office Products"),
    Interest(id: 7, name: "Tools & Home Improvement"),
    Interest(id: 8, name: "Beauty & Personal Care"),
    Interest(id: 9, name: "Pet Supplies"),
    Interest(id: 10, name: "Baby Products"),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Container(
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            ),
            color: Color.fromRGBO(228, 180, 180, 1),
          ),
          child: Align(
            alignment: FractionalOffset.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height *0.4,
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
        Container(

          margin: EdgeInsets.only(top: 30),
          // ignore: deprecated_member_use
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromRGBO(228, 180, 180, 1),
            //0xFFBF8989 CEAEAF E4B4B4
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            onPressed: () async {
              if (_selectedinterest.isEmpty) {
                return _MyQuestionPage3();
              } else {
                // ignore: deprecated_member_use
                var categories = new List();
                if (answer.isEmpty) {
                  for (int i = 0; i < _selectedinterest.length; i++) {
                    String x = _selectedinterest[i].name;
                    categories.add(x);
                  }
                } else {
                  for (int i = 0; i < _selectedinterest.length; i++) {
                    String x = _selectedinterest[i].name;
                    answer.add(x);
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => load(
                          answer: answer,
                          categories: categories,
                        )));
              }
            },
            child: Text(
              "Search".toUpperCase(),
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

