class CartModel {
  int? id;
  int? userId;
  String? date;
  List<Products>? products;
  int? iV;

  CartModel({this.id, this.userId, this.date, this.products, this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

}