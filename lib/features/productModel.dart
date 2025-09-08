class ProductModel {
  int? id;
  String? title;
  String? description;
  num? price;
  String? category;
  String? image;
  Rating? rating;
  ProductModel(
      {this.image,
        this.price,
        this.title,
        this.description,
        this.id,
        this.category,
        this.rating});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'] !=null? Rating.fromJson(json['rating']):null ;
  }
}

class Rating {
  num? rate;
  int? count;
  Rating({this.rate, this.count});
  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
