import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/cart_provider.dart';
import 'package:ecommerce/pages/productItem.dart';
import 'package:ecommerce/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<Product> coffeeProducts = [
    Product(name: 'Espresso', image: 'Espresso.png', price: 2.99, inStock: true, details: 'Strong and bold espresso shot.'),
    Product(name: 'Cappuccino', image: 'Capuccino.png', price: 3.99, inStock: true, details: 'A perfect blend of espresso, steamed milk, and foam.'),
    Product(name: 'Latte', image: 'latte.png', price: 4.49, inStock: false, details: 'Smooth and creamy latte.'),
    Product(name: 'Americano', image: 'americano.png', price: 2.49, inStock: true, details: 'Espresso diluted with hot water.'),
    Product(name: 'Pastries', image: 'pastries.png', price: 4.99, inStock: false, details: 'Freshly baked pastries.'),
    Product(name: 'Smoothie', image: 'smoothie.png', price: 3.79, inStock: true, details: 'Healthy and refreshing fruit smoothie.'),
    Product(name: 'Tea', image: 'tea.png', price: 3.29, inStock: true, details: 'A variety of teas to choose from.'),
    Product(name: 'Hot Chocolate', image: 'hotchocolate.png', price: 5.99, inStock: false, details: 'Rich and creamy hot chocolate.'),
  ];

  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(coffeeProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopeasy'),
        actions: <Widget>[
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Products...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: _filterProducts,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: displayedProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: displayedProducts[index],
            onAddToCart: (product) {
              _addToCart(context, product);
            },
            onViewDetails: (product) {
              _showProductDetails(context, product);
            },
            onPreorder: (product) {
              _preorderProduct(context, product);
            },
          );
        },
      ),
    );
  }

  void _filterProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedProducts = List.from(coffeeProducts);
      });
      return;
    }
    final filtered = coffeeProducts.where((product) {
      final productName = product.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return productName.contains(searchLower);
    }).toList();

    setState(() {
      displayedProducts = filtered;
    });
  }

  void _addToCart(BuildContext context, Product product) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Added to Cart'),
          content: Text('${product.name} has been added to your cart.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/${product.image}'),
              const SizedBox(height: 10),
              Text('\$${product.price.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Text(product.details),
              const SizedBox(height: 10),
              Text(
                product.inStock ? 'In Stock' : 'Out of Stock',
                style: TextStyle(
                  color: product.inStock ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            if (!product.inStock)
              ElevatedButton(
                onPressed: () {
                  _preorderProduct(context, product);
                  Navigator.of(context).pop();
                },
                child: const Text('Preorder'),
              ),
          ],
        );
      },
    );
  }

  void _preorderProduct(BuildContext context, Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} has been preordered.'),
      ),
    );
  }
}
