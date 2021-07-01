import 'package:flutter/material.dart';

// ignore: camel_case_types
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(25),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: 'Search..',
          hintStyle: TextStyle(fontSize: 18,color: Colors.grey[400]),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: .8),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: .8,color: Theme.of(context).primaryColor),
          ) ,
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Colors.grey[400],
          ),
          suffixIcon: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.clear,
              size: 25,
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
//end searchBar
class CenterName extends StatelessWidget {
  final String Name ;
  const CenterName({
    Key key,@required this.Name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Name,
        style: TextStyle(
          letterSpacing: 1,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(228, 180, 180, 1),
        ),
      ),
    );
  }
}
class questionHeader extends StatelessWidget {
  final String qHeader ;
  const questionHeader({
    Key key,@required this.qHeader
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              qHeader,
              style: TextStyle(
                color: Color.fromRGBO(228, 180, 180, 1),
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class nextButtom extends StatelessWidget {
  final GestureTapCallback onp;
   nextButtom({
    Key key,@required this.onp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        onPressed: onp ,
        child: Text(
          "Next".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}




