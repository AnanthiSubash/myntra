import 'package:flutter/material.dart';

import '../api/getProduct.dart';
import '../model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ProductDetails.dart';



class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final fashionProductsProvider = FutureProvider<List<Product>>((ref) async {
    return await FashionProductService.fetchFashionProducts();
  });

@override
Widget build(BuildContext context, WidgetRef ref) {
  final fashionProducts = (ref.watch(fashionProductsProvider));
  return Scaffold(
    appBar: AppBar(
      title: Text('Myntra'),
      centerTitle: true,
      backgroundColor: Colors.amber,
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child:Image.asset(
              'assets/myntra.png', // Path to your splash image
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
          ),
          ListTile(
            title: Text('Orders'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('Cart'),
            onTap: () {

            },),
            ListTile(
              title: Text('My Account'),
              onTap: () {

              },
          ),
          // Add more ListTile widgets for additional items
        ],
      ),
    ),
    body: fashionProducts.when(
      data: (fashionProducts) {
        return ListView.builder(
          itemCount: fashionProducts.length,
          itemBuilder: (context, index) {
            final product = fashionProducts[index];
            return ListTile(
              leading: Image.network(
                product.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.title),
              subtitle: Text('₹ ${product.price.toStringAsFixed(2)}'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      imageUrl: product.image,
                      productName: product.title,
                      price: product.price,
                      description: product.description,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    ),
  );
}

}
