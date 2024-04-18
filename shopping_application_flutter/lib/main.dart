import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: List.generate(10, (index) {
            return ProductItem(
              imageUrl:
                  'assets/product${index + 1}.jpg', // Assuming you have product images named product1.jpg, product2.jpg, etc. in your assets folder
              productName: 'Product ${index + 1}',
            );
          }),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String productName;

  const ProductItem({
    Key? key,
    required this.imageUrl,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle product tap
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            productName,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
