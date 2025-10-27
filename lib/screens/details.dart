import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shopy/models/product.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:shopy/providers/add_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/screens/home.dart';

class Details extends ConsumerWidget {
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
        title: Text("Order Page".toUpperCase(), style: TextStyle(fontSize: 20)),
        backgroundColor: const Color.fromARGB(94, 0, 0, 0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hint: Text("Enter Name"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hint: Text("Enter Contact Number"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hint: Text("Enter Address"),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Image.network(cartItems[index].img, height: 100),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(cartItems[index].title),
                              Text("\$ ${cartItems[index].price.toString()}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            decoration: BoxDecoration(color: const Color.fromARGB(94, 0, 0, 0)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Wohoo, Your Order is placed and it will be delivered to you soon. 🎉 🎉 🎉',
                      ),
                    ),
                  );
                },
                child: Text("Place Order", style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
