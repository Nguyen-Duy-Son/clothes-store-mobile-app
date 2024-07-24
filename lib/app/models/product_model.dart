// import 'dart:ui';
//
// class Product {
//   final String name;
//   final String image;
//   final String id;
//   final int price;
//   final int categoryId;
//   final String rating;
//   final String description;
//   final List<String> size;
//   final List<Color> color;
//
//   Product({
//     required this.name,
//     required this.image,
//     required this.id,
//     required this.price,
//     required this.categoryId,
//     required this.rating,
//     required this.description,
//     required this.size,
//     required this.color,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       name: json['name'],
//       image: json['image'],
//       id: json['id'] as String,
//       price: json['price'] as int,
//       categoryId: json['categoryId'] as int,
//       rating: json['rating'] as String,
//       description: json['description'] as String,
//       size: json['size'].cast<String>(),
//       color: (json['color'] as List).map((colorName) => _colorFromName(colorName)).toList(),
//     );
//   }
//
//   static Color _colorFromName(String colorName) {
//     final Map<String, Color> colorMap = {
//       'black': Color(0xFF000000),
//       'blue': Color(0xFF0000FF),
//       'green': Color(0xFF008000),
//       'red': Color(0xFFFF0000),
//       'yellow': Color(0xFFFFFF00),
//       // Add more colors as needed
//     };
//
//     return colorMap[colorName.toLowerCase()] ?? Color(0xFFFFFFFF); // Default to white if color name is not found
//   }
// }
import 'dart:ui';

class Product {
  final String name;
  final String image;
  final String id;
  final int price;
  final int categoryId;
  final String rating;
  final String description;
  final List<String> size;
  final Map<String, Color> color;
  bool isFavourite;


  Product({
    required this.name,
    required this.image,
    required this.id,
    required this.price,
    required this.categoryId,
    required this.rating,
    required this.description,
    required this.size,
    required this.color,
    required this.isFavourite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'],
      id: json['id'] as String,
      price: json['price'] as int,
      categoryId: json['categoryId'] as int,
      rating: json['rating'] as String,
      description: json['description'] as String,
      size: json['size'].cast<String>(),
      color: Map.fromIterable(
        json['color'],
        key: (colorName) => colorName,
        value: (colorName) => _colorFromName(colorName),
      ),
      isFavourite: json['isFavourite'] as bool? ?? false,
    );
  }

  static Color _colorFromName(String colorName) {
    final Map<String, Color> colorMap = {
      'black': Color(0xFF000000),
      'blue': Color(0xFF0000FF),
      'green': Color(0xFF008000),
      'red': Color(0xFFFF0000),
      'yellow': Color(0xFFFFFF00),
    };

    return colorMap[colorName.toLowerCase()] ?? Color(0xFFFFFFFF);
  }
}