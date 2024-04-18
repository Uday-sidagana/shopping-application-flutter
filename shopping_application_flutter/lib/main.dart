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
          children: List.generate(5, (index) {
            return ProductItem(
              imageUrl: 'assets/product${index + 1}.jpg',
              productName: 'Product ${index + 1}',
              productPrice: '\$${(index + 1) * 10}', // Sample price calculation
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
  final String productPrice;

  const ProductItem({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              imageUrl: imageUrl,
              productName: productName,
              productPrice: productPrice,
            ),
          ),
        );
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

class ProductDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  const ProductDetailsPage({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Price: $productPrice',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      imageUrl: imageUrl,
                      productName: productName,
                      productPrice: productPrice,
                    ),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  const CartPage({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              productName,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: $productPrice',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle payment
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
