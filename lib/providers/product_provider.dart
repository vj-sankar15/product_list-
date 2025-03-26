import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:html' as html; // Add this import for web
import 'dart:typed_data';

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
    "photo Frames",
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
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

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
          createdProduct["id"] =
              DateTime.now().millisecondsSinceEpoch.toString();
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

  void filterByCategory(String category) async {
    _selectedCategory = category;

    if (category == "All") {
      fetchProducts(); // Reload all products if "All" is selected
    } else {
      await fetchProducts(); // Reload all products if "All" is selected

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


  Future<void> generatePDF(List<Map<String, dynamic>> products) async {
    if (products.isEmpty) {
      print("⚠️ No products available!");
      return;
    }

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return [
            pw.Container(
              padding: pw.EdgeInsets.all(5),
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Title
                  pw.Text(
                    "Product List",
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  // Header Row
                  pw.Container(
                    padding: pw.EdgeInsets.symmetric(horizontal: 8),
                    decoration: pw.BoxDecoration(
                      border: pw.Border(bottom: pw.BorderSide(width: 1)),),
                    child: pw.Row(
                      children: [
                        _headerCell("ID", 40),
                        _headerCell("Title", 300),
                        _headerCell("Price", 80),
                        _headerCell("Category", 120),
                      ],
                    ),
                  ),
                  

                  // Product Rows
                  ...products.map((product) => pw.Container(
                    child: pw.Row(
                      children: [
                        pw.Container(
                          height: 50,
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: _dataCell(product['id']?.toString() ?? "N/A", 40),
                        ),
                        pw.Container(
                          height: 50,
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: _dataCell(product['title'] ?? "N/A", 300),
                        ),
                        pw.Container(
                          height: 50,
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: _dataCell("\$${product['price']?.toString() ?? "0.00"}", 80),
                        ),
                        pw.Container(
                          height: 50,
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          child: _dataCell(product['category'] ?? "Unknown", 120),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            )    
          ];
        },
      ),
    );

    // Get the PDF bytes
    final bytes = await pdf.save();

    // For web download
    _downloadPdfWeb(bytes, 'products.pdf');
  }

  // Web-specific download function
  void _downloadPdfWeb(Uint8List bytes, String fileName) {
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  // Keep your existing helper methods
  pw.Widget _headerCell(String text, double width) {
    return pw.Container(
      width: width,
      alignment: pw.Alignment.centerLeft,
      padding: pw.EdgeInsets.symmetric(horizontal: 8),
      child: pw.Text(
        text,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      ),
    );
  }

  pw.Widget _dataCell(String text, double width) {
    return pw.Container(
      width: width,
      alignment: pw.Alignment.centerLeft,
      padding: pw.EdgeInsets.symmetric(horizontal: 8),
      child: pw.Text(text),
    );
  }
}



//   generateExcel(List<Map<String, dynamic>> products) async {

//   var excel = Excel.createExcel();
  

//   var sheet = excel['Products'];

//   // Ensure there's at least one product to determine column headers
//   if (products.isEmpty) {
//     return print('Data not added');
//   }
//  sheet.appendRow([
//     TextCellValue("ID"),
//     TextCellValue("Title"),
//     TextCellValue("Price"),
//     TextCellValue("Category"),
//   ]);

//   // // Add Product Details
//   for (var product in products) {
//     sheet.appendRow([
//       TextCellValue(product['id'].toString()),
//       TextCellValue(product['title']),
//       TextCellValue(product['price'].toString()),
//       TextCellValue(product['category']),
//     ]);
//   }
//       String defaultSheet = excel.sheets.keys.first;
//   excel.delete(defaultSheet);

//   // Get Directory for saving the file
//   final directory = await getApplicationDocumentsDirectory();
//   String filePath = "${directory.path}/product78.xlsx"; // For Android & iOS

//   // Save Excel file
//   File(filePath)
//     ..createSync(recursive: true)
//     ..writeAsBytesSync(excel.encode()!);

//   print("Excel file saved at: $filePath");
// }




  // void filterByCategory(String category) {} 