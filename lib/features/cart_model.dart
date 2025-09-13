class CartModel {
  final int? id;
  final int? userId;
  final String? date;
  final List<Products>? products;
  final int? iV;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.iV,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: _toInt(json['id']),
      userId: _toInt(json['userId']),
      date: json['date']?.toString(),
      products: (json['products'] as List<dynamic>?)
          ?.map((v) => Products.fromJson(v))
          .toList(),
      iV: _toInt(json['__v']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products?.map((v) => v.toJson()).toList(),
      '__v': iV,
    };
  }

  CartModel copyWith({
    int? id,
    int? userId,
    String? date,
    List<Products>? products,
    int? iV,
  }) {
    return CartModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      products: products ?? this.products,
      iV: iV ?? this.iV,
    );
  }
}

class Products {
  final int? productId;
  final int? quantity;

  Products({this.productId, this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: _toInt(json['productId']),
      quantity: _toInt(json['quantity']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  Products copyWith({
    int? productId,
    int? quantity,
  }) {
    return Products(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}

/// Helper function to safely parse int
int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  return int.tryParse(value.toString());
}
