import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class services {

  getData(url) async {
    http.Response response = await http.get(url);
      var decodedData = convert.jsonDecode(response.body);
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
      return mapedData;

  }

  // ignore: non_constant_identifier_names
  recommend(var ProductName) async {
    var data = await getData(Uri.https('10.0.2.2:5000', '/api', {"Query": ProductName}));
      return data;
    }

  ///Rule Based
  all(List answer) async {
    var mappedData = await getData(Uri.https('10.0.2.2:5000', '/all'));

      var newData, recommendedData;
      // ignore: deprecated_member_use
      newData = new List();
      // ignore: deprecated_member_use
      recommendedData = new List();


      for (int i = 1; i < mappedData.length; i++) {
        if (double.parse(mappedData[i]["Selling Price"]) <= answer[0]) {
          if (answer[1] <= 8) {
            if (mappedData[i]["Category"] == "Baby Products ") {
              recommendedData.add(mappedData[i]);

            }
          } else if (answer[1] > 8 && answer[1] <= 16) {
            if (mappedData[i]["Category"] == "Baby Products " ||
                mappedData[i]["Category"] == "Toys & Games ") {
              recommendedData.add(mappedData[i]);


            }
          } else if (mappedData[i]["Category"] != "Baby Products " &&
              mappedData[i]["Category"] != "Toys & Games ") {
            newData.add(mappedData[i]);
          }
        }
      }
      if (answer[1] > 16) {
        for (int  i = 0; i < newData.length; i++) {
          for (int z = 0; z < answer.length; z++) {
            if (newData[i]["Category"] == answer[2][z]) {
              recommendedData.add(newData[i]);
            }
          }
        }
      }

      return recommendedData;

  }
  ///End of Rule Based
  ///Browse With Category
  browseTheCategories(List selectedCategories) async {
    var mappedData = await getData(Uri.https('10.0.2.2:5000', '/all'));

      var  browsedCategory;
      // ignore: deprecated_member_use
      browsedCategory = new List();
      for (int i = 1 ; i < mappedData.length; i++) {
        for (int j = 0; j < selectedCategories.length; j++) {
          if (selectedCategories[j] == mappedData[i]["Category"]) {
            browsedCategory.add(mappedData[i]);
          }
        }
      }
      return browsedCategory;
    }
  }



