import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gridview/service.dart';
import 'ProductDetailsScreen.dart';

// ignore: must_be_immutable
class GiftScreen extends StatefulWidget {
  GiftScreen({this.productFromQuestion}) ;
  var productFromQuestion ;

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  // ignore: non_constant_identifier_names
  _buildProduct(var ProductDetails ,int index ) {

    return GestureDetector(
      onTap: () async{
        print("Loading");
        services s = new services();
        var x = await s.recomend(widget.productFromQuestion[index]["Product Name"]);
        print(x[2]["Image Url"]);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: widget.productFromQuestion[index],recommend: x,)),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ProductDetails["Image Url"]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  ProductDetails["Product Name"],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ProductDetails["Selling Price"].toString()+' \$',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,

              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(228, 180, 180, 1),
        ),
        body: ListView(
          children: [

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Text(
                'Your Gifts',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GridView.builder(
                padding: EdgeInsets.all(15),
                itemCount: widget.productFromQuestion.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: .693,
                ),
                itemBuilder: (BuildContext context,int index)
                {
                  var product= widget.productFromQuestion[index];
                  return _buildProduct(product , index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


