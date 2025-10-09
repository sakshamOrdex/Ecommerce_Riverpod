import 'package:flutter_riverpod/legacy.dart';
import 'package:shopy/models/product.dart';

final cartProvider=StateNotifierProvider<cartNotifier,List<Product>>((ref){
  return cartNotifier();
});

class cartNotifier extends StateNotifier<List<Product>>{
  cartNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }
}
