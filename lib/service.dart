import 'dart:convert' as convert;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import 'feedback.dart';

// ignore: camel_case_types
class services {

  getData(url) async {
    try {
      http.Response response = await http.get(url);
      var decodedData = convert.jsonDecode(response.body);
      // ignore: deprecated_member_use
      var mapedData = new List();
      for (int i = 1; i < decodedData.length; i++) {
        mapedData.add({
          "Product Name": decodedData["$i"][0],
          "Category": decodedData["$i"][1],
          "Selling Price": decodedData["$i"][2],
          "About Product": decodedData["$i"][3],
          "Image Url": decodedData["$i"][4],
          "Product Url": decodedData["$i"][5]
        });
      }
      mapedData..shuffle();
      return mapedData;
    }catch(e){
      print(e);
      return null ;
    }
  }

  // ignore: non_constant_identifier_names
  recommend(var ProductName) async {
    try {
      var data = await getData(
          Uri.https('192.168.100.23:5000', '/api', {"Query": ProductName}));
      while (data == null) {
        data = await getData(
            Uri.https('192.168.100.23:5000', '/api', {"Query": ProductName}));
      }
      return data;
    }catch(e){
      print(e);
    }
  }

  ///Rule Based
  all(List answer) async {
    try {
      var mappedData = await getData(Uri.https('192.168.100.23:5000', '/all'));
      while(mappedData==null)
        {
          mappedData = await getData(Uri.https('192.168.100.23:5000', '/all'));
        }

      var newData, recommendedData;
      // ignore: deprecated_member_use
      newData = new List();
      // ignore: deprecated_member_use
      recommendedData = new List();
      for (int i = 1; i < mappedData.length; i++) {
        if (double.parse(mappedData[i]["Selling Price"]) <= answer[0]) {
          if (answer[1] <= 8 && recommendedData.length < 52) {
            if (mappedData[i]["Category"] == "Baby Products") {
              recommendedData.add(mappedData[i]);
            }
          } else
          if (answer[1] > 8 && answer[1] <= 16 && recommendedData.length < 52) {
            if (mappedData[i]["Category"] == "Baby Products" ||
                mappedData[i]["Category"] == "Toys & Games") {
              recommendedData.add(mappedData[i]);
            }
          } else if (mappedData[i]["Category"] != "Baby Products" &&
              mappedData[i]["Category"] != "Toys & Games") {
            newData.add(mappedData[i]);
          }
        }
      }
      if (answer[1] > 16) {
        for (int i = 0; i < newData.length &&
            recommendedData.length < 52; i++) {
          for (int z = 2; z < answer.length; z++) {
            if (newData[i]["Category"] == answer[z]) {
              recommendedData.add(newData[i]);
            }
          }
        }
      }

      return recommendedData;
    } catch (e) {
        print(e);
    }
  }
  ///End of Rule Based
  ///Browse With Category
  browseTheCategories(List selectedCategories) async {
    try {
      var mappedData = await getData(Uri.https('192.168.100.23:5000', '/all'));
        while(mappedData== null ) {
          mappedData = await getData(Uri.https('192.168.100.23:5000', '/all'));
        }
      var browsedCategory;
      // ignore: deprecated_member_use
      browsedCategory = new List();
      // ignore: deprecated_member_use
      for (int i = 1; i < mappedData.length &&
          browsedCategory.length < 52; i++) {
        for (int j = 0; j < selectedCategories.length; j++) {
          if (selectedCategories[j] == mappedData[i]["Category"]) {
            browsedCategory.add(mappedData[i]);
          }
        }
      }

      return browsedCategory;
    }catch(e){
      print(e);
    }
  }
  Future<void> giveFeedback (feedback feed) async{
    // ignore: deprecated_member_use
    await FirebaseFirestore.instance.collection('feedback').add(feed.toData()).catchError((e){
      print(e);});
  }
  }



