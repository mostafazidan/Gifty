import 'package:flutter/material.dart';
class navbar extends StatefulWidget {

  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0, true),
          buildNavBarItem(Icons.search, 1, false),
          buildNavBarItem(Icons.feedback, 2, false),

        ],
      ),

    );
  }
  Widget buildNavBarItem(IconData icon, int index, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 3,
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
}


