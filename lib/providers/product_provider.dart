import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:shopy/models/product.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  try {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw "Sowething Went Wrong!";
    }
  } catch (e) {
    rethrow;
  }
});
