import 'dart:io';
import "package:excel/excel.dart";
import 'package:path_provider/path_provider.dart';
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
    notifyListeners(); 

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
      notifyListeners(); 
    }
  }

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
      // await fetchProducts();
    } else {
      throw Exception("Failed to add product");
    }
  } catch (e) {
    print("Error adding product: $e");
  }
}


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
  generateExcel(List<Map<String, dynamic>> products) async {
  var excel = Excel.createExcel();
  var sheet = excel['Products'];

  // Ensure there's at least one product to determine column headers
  if (products.isEmpty) {
    print("No products available to generate an Excel file.");
    return;
  }

  
  
  
 sheet.appendRow([
    TextCellValue("ID"),
    TextCellValue("Title"),
    TextCellValue("Price"),
    TextCellValue("Category"),
  ]);

  // // Add Product Details
  for (var product in products) {
    sheet.appendRow([
      TextCellValue(product['id'].toString()),
      TextCellValue(product['title']),
      TextCellValue(product['price'].toString()),
      TextCellValue(product['category']),
    ]);
  }
    

  // Get Directory for saving the file
  final directory = await getApplicationDocumentsDirectory(); // For Android & iOS
  String filePath = "${directory.path}/product1.xlsx";

  // Save Excel file
  File(filePath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(excel.encode()!);

  print("Excel file saved at: $filePath");
}




  // void filterByCategory(String category) {}
}