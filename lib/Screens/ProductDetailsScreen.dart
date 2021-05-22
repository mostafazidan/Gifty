import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gridview/service.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
   var product;
   var recommend ;
  ProductScreen({this.product  , this.recommend});
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _buildRecommendedList(var product , var i) {
    return GestureDetector(
      onTap: ()async{
        print("Loooding");
        services s = new services();
        var x = await s.recomend(product["Product Name"]);
        print(x[2]["Image Url"]);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: product,recommend: x,)),
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
                height: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product["Image Url"]),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Expanded(
                  child: Text(
                    product["Selling Price"].toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),*/
              /*Expanded(
                child: Text(
                  product["Selling Price"].toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )*/
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
        body: ListView(
            children: [
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product["Image Url"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product["Product Name"],
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.product["Selling Price"]+' \$',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(widget.product["About Product"],
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: Text('Related Products',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 300,
                color: Colors.grey[100],
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.length,
                  itemBuilder: (BuildContext context,int index){
                    var product=widget.recommend[index];
                    return _buildRecommendedList( product , index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                  onPressed: (){

                  },
                  child: Text(
                    'BUY',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
