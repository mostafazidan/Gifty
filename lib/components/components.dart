import 'package:flutter/material.dart';
import 'package:gridview/Screens/gridView.dart';
import 'package:gridview/Screens/questionsScreen.dart';
import '../service.dart';
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



