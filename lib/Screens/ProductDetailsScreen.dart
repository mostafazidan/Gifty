import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/service.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import '../feedback.dart';

feedback feeds = new feedback();
services s = new services();

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  var product;
  var recommend ;
  final List answer ;
  final List categories ;
  ProductScreen({this.product  , this.recommend ,this.categories,this.answer});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  Widget build(BuildContext context) {

    feeds.productName = widget.product["Product Name"];
    feeds.price = widget.product["Selling Price"];
    feeds.productUrl = widget.product["Product Url"];
    feeds.imageUrl = widget.product["Image Url"];
    if(widget.answer.isEmpty){
      feeds.interests = widget.categories;
    }else{
      feeds.age = widget.answer[1];
      feeds.padget= widget.answer[0];

    }
    feeds.aboutProduct= widget.product["About Product"];
    feeds.occasion="Wedding";
    feeds.category= "Sprot & Outdoor";
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
                    Text(
                      widget.product["Product Name"],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.product["Selling Price"]+' \$',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Rating(feeds) ,
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
                  itemCount: widget.recommend.length,
                  itemBuilder: (BuildContext context,int index){
                    var recommendedProduct=widget.recommend[index];
                    return _buildRecommendedList( recommendedProduct );
                  },
                ),
              ),

              ///Buy Button
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                  onPressed: (){
                    launch(widget.product["Product Url"]);
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
  _buildRecommendedList(var recommendedProduct ) {

    return GestureDetector(
      onTap: ()async{
        //print("Loooding");
        services s = new services();
        var x = await s.recommend(recommendedProduct["Product Name"]);
        //print(recommendedProduct["Image Url"]);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: recommendedProduct,recommend: x,)),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 155,
                height: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(recommendedProduct["Image Url"]),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    width: 150,
                    child: Text(
                      recommendedProduct["Product Name"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,bottom: 5),
                child: Text(
                  recommendedProduct["Selling Price"].toString() +' \$',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
class Rating extends StatefulWidget {
  final feedback feed ;
  Rating(this.feed);
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 4.0 ;
  @override
  Widget build(BuildContext context) {
    return Column(
        children :[ SmoothStarRating(
          rating: rating,
          size: 45,
          filledIconData: Icons.star,
          defaultIconData: Icons.star_border,
          spacing: 2.0,
          starCount: 5,
          onRated: (value){
            setState(() {
              rating= value;
              show(rating.toInt());
            });

          },

        ),

        ]
    );
  }

  void show(int rating) {

    showDialog(context: context,barrierDismissible: true, builder: (context){
      return RatingDialog(
          title: "Give Feed Back",
          initialRating: rating,
          image: Icon(Icons.star , size: 100,color: Colors.red,),
          submitButton: "Submit",
          onSubmitted: (response){
            feeds.rate= response.rating;
            feeds.comment =response.comment;
            s.giveFeedback(feeds);
          }
      );
    });
  }
}
