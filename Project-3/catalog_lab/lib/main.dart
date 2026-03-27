import 'package:flutter/material.dart';

void main() {
  runApp(CatalogApp());
}

// Product Model
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

// Main App
class CatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      home: CatalogScreen(),
    );
  }
}

// Catalog Screen
class CatalogScreen extends StatelessWidget {
  final List<Product> products = List.generate(
    10,
    (index) => Product(
      name: 'Product $index',
      price: (index + 1) * 10.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),

      body: Column(
        children: [
          // LIST VIEW
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('\$${products[index].price}'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Clicked ${products[index].name}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          Divider(),

          // GRID VIEW
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: Text(products[index].name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}