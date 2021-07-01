class feedback{
  String productName ;
  String category ;
  String productUrl ;
  String imageUrl ;
  String aboutProduct ;
  String price ;
  int age ;
  List interests;
  String meansToYou ;
  String occasion;
  int rate ;
  double padget ;
  String comment ;

  feedback({
      this.rate,
      this.productName,
      this.category,
      this.productUrl,
      this.imageUrl,
      this.aboutProduct,
      this.price,
      this.age,
      this.interests,
      this.occasion,
    this.meansToYou,
    this.padget,
    this.comment,
  });

  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productUrl'] = this.productUrl;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['aboutProduct'] = this.aboutProduct;
    data['price'] = this.price;
    data['occasion'] = this.occasion;
    data['age'] = this.age;
    data['interests']= this.interests;
    data['rate']= this.rate;
    data['padget']= this.padget;
    data['meansToYou']= this.meansToYou;
    data['comment']= this.comment;
    return data;
  }
}
