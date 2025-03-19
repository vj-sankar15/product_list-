import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProductProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _filteredProducts = [];
  bool _isLoading = false;
  bool _isGridView = true;
  String _selectedCategory = "All";
  final List<String> _categories = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
    "photo Frames"
  ];

  List<Map<String, dynamic>> get products => _products;
  List<Map<String, dynamic>> get filteredProducts => _filteredProducts;
  bool get isLoading => _isLoading;
  bool get isGridView => _isGridView;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => _categories;


  /// Fetch Products from API
  Future<void> fetchProducts() async {
    notifyListeners(); // Notify UI to show loading

    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        _products = List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      notifyListeners(); // Notify UI to update after fetching data
    }
  }


  // Future<void> fetchProducts() async {
  //    = tru_isLoadinge;
  //   Future.delayed(Duration.zero, () {
  //     notifyListeners();
  //   });
  //   try {
  //     final response = await http.get(
  //       Uri.parse('https://fakestoreapi.com/products'),
  //     );
  //     if (response.statusCode == 200) {
  //       _products = List<Map<String, dynamic>>.from(jsonDecode(response.body));
  //     }
  //   } catch (e) {
  //     print("Error fetching products: $e");
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  // }

Future<void> addProduct(Map<String, dynamic> newProduct) async {
     notifyListeners();
  try {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(newProduct),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> createdProduct = json.decode(response.body);

      // Ensure the newly created product has an ID
      if (!createdProduct.containsKey("id")) {
        createdProduct["id"] = DateTime.now().millisecondsSinceEpoch.toString();
      }

      _products.add(createdProduct); // Add product with correct structure
      notifyListeners(); // Notify UI

      // Fetch latest products from API to ensure consistency
      await fetchProducts();
    } else {
      throw Exception("Failed to add product");
    }
  } catch (e) {
    print("Error adding product: $e");
  }
}



  // Future<void> addProduct(Map<String, dynamic> newProduct) async {
    
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://fakestoreapi.com/products'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(newProduct),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final createdProduct = jsonDecode(response.body);
  //       _products.add(createdProduct);
  //     }
  //   } catch (e) {
  //     print("Error adding product: $e");
  //   }

  //   _isLoading = false;
  //   notifyListeners();
  // }

  List<Map<String, dynamic>> searchProducts(String query) {
    if (query.length < 3) return [];
    notifyListeners();
    return _products
        .where(
          (product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  void filterByCategory(String category) async{
    _selectedCategory = category;

    if (category == "All") {
      fetchProducts(); // Reload all products if "All" is selected
    } else {
    await  fetchProducts(); // Reload all products if "All" is selected

      _products =
          _products
              .where((product) => product['category'] == category)
              .toList();
    }
  }

  void toggleView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}
