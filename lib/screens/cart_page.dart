import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/providers/add_cart.dart';
import 'package:shopy/screens/details.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Cart'.toUpperCase()),
        backgroundColor: const Color.fromARGB(94, 0, 0, 0),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return ListTile(
                        leading: Image.network(product.img, width: 50),
                        title: Text(product.title),
                        subtitle: Text(
                          "\$${product.price}",
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(cartProvider.notifier)
                                .removeProduct(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(94, 0, 0, 0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Total: \$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: cartItems.isEmpty
          ? Container()
          : Container(
              width: 250,
              height: 40,
              child: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details()),
                  );
                },
                child: Text("Place Order", style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
