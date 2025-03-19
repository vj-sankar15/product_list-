import 'package:flutter/material.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController searchController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
        var provider =  context.read<ProductProvider>();

    return Scaffold(
      floatingActionButton:  FloatingActionButton.extended(
                  onPressed: ()  => _showAddProductDialog(context, provider),
                  label: const Text('AddProduct'),
                  icon: const Icon(Icons.add),
                ),
      appBar: AppBar(title: Text("Product List"),),
      body: Consumer<ProductProvider>(
        builder:
            (context, provider, child) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            labelText: "Search Product",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed:
                                  () => provider.searchProducts(
                                    searchController.text.trim(),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          provider.isGridView ? Icons.list : Icons.grid_view,
                        ),
                        onPressed: provider.toggleView,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Filter by Category"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                      provider.categories.map((category) {
                                        return ListTile(
                                          title: Text(category),
                                          onTap: () {
                                            provider.filterByCategory(category);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                        );
                                      }).toList(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child:
                      provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : provider.products.isEmpty
                          ? Center(child: Text("No products found"))
                          : provider.isGridView
                          ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 300,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: provider.products.length,
                            itemBuilder: (context, index) {
                              final product = provider.products[index];
                              return GestureDetector(
                                onTap: () {
                                  print(product);
                                  Navigator.pushNamed(
                                    context,
                                    '/details',
                                    arguments: product['id'].toString(),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          product['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              product['title'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "Price: \$${product['price']}".toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                         
                          )
                          : ListView.builder(
                            itemCount: provider.products.length,
                            itemBuilder: (context, index) {
                              final product = provider.products[index];
                              return ListTile(
                                leading: Image.network(
                                  product['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product['title']),
                                subtitle: Text("Price: \$${product['price']}"),
                                onTap: () {
                                  print(
                                    "Product Clicked: \${product['title']} - \$\${product['price']}",
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    '/details',
                                    arguments: product['id'].toString(),
                                  );
                                },
                              );
                            },
                          ),
                ),
              
                // SizedBox(width: 100,height: 50,
                //     child: FloatingActionButton.extended(
                //     onPressed: () => _showAddProductDialog(context, provider),
                //    label: const Text('Add Products'), 
                //    ),
                // ),
              ],
            ),
      ),
    );
    
  }

  void _showAddProductDialog(BuildContext context, ProductProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Product"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: "Image URL"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                provider.addProduct({
                  "title": titleController.text,
                  "price": double.parse(priceController.text),
                  "image": imageUrlController.text,
                  "category": "electronics",
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
