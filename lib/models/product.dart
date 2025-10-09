class Product {
  final int id;
  final String title;
  final String img;
  final double price;
  final String description;
  final String category;
  
  Product({
    required this.id,
    required this.title,
    required this.img,
    required this.price,
    required this.description,
    required this.category
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      img: json['image'],
      price: json['price'],
      description: json['description'],
      category:json['category']
    );
  }
}
