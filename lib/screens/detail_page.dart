// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final String product_id;
  const ProductDetailPage({super.key, required this.product_id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, dynamic>? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<ProductProvider>(context, listen: false);
    product = Map<String, dynamic>.from(
      provider.products.firstWhere(
        (element) => element["id"].toString() == widget.product_id,
        orElse: () => {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product!['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product!['image'], height: 200),
            SizedBox(height: 10),
            Text(
               "Price: \$${product!['price']}".toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
               SizedBox(height: 8),
             Text(product!['description']),
          ],
        ),
      ),
    );
  }
}
