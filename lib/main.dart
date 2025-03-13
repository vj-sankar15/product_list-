// import 'package:flutter/material.dart';

// void main() {
//   runApp(DemoWidget());
// }

// class DemoWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Contact Info:')),
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: MyForm(),
//         ),
//       ),
//     );
//   }
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();

//   // Controllers for the text fields
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();

//   // List to store entered data
//   List<Map<String, String>> dataList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           // Name input field (Only alphabets allowed)
//           _buildTextFormField(
             
//             "Enter your name", 
//             "Please enter your full name", 
//             _nameController, 
//             TextInputType.text,
//             nameValidator
//           ),
          
//           SizedBox(height: 16),

//           // Phone number input field (Only 10 digits allowed)
//           _buildTextFormField(
//             "Phone number", 
//             "Enter your phone number", 
//             _phoneController, 
//             TextInputType.phone,
//             phoneValidator
//           ),
//           SizedBox(height: 16),

//           // Email input field (Must be a valid Gmail address)
//           _buildTextFormField(
//             "Email address", 
//             "Enter your email address", 
//             _emailController, 
//             TextInputType.emailAddress,
//             emailValidator
//           ),
//           SizedBox(height: 16),

//           // Submit Button
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState?.validate() ?? false) {
//                 // If the form is valid, save the data in the list
//                 setState(() {
//                   dataList.add({
//                     'Name': _nameController.text,
//                     'Phone': _phoneController.text,
//                     'Email': _emailController.text,
//                   });
//                 });

//                 // Show a message
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Data Saved!')),
//                 );

//                 // Clear the input fields for the next entry
//                 _nameController.clear();
//                 _phoneController.clear();
//                 _emailController.clear();
//               }
//             },
//             child: Text('Submit'),
//           ),
//           SizedBox(height: 16),

//           // Display the entered data in a DataTable (Tabulated format)
//           Expanded(
//             child: dataList.isEmpty
//                 ? Center(child: Text('No data to display'))
//                 : DataTable(
//                     columns: [
//                       DataColumn(label: Text('S.No')),
//                       DataColumn(label: Text('Name')),
//                       DataColumn(label: Text('Phone')),
//                       DataColumn(label: Text('Email')),
//                     ],
//                     rows: dataList.asMap().entries.map((entry) {
//                       int index = entry.key; // This is the serial number
//                       Map<String, String> data = entry.value;

//                       return DataRow(cells: [
//                         DataCell(Text((index + 1).toString())), // Serial number
//                         DataCell(Text(data['Name'] ?? '')),
//                         DataCell(Text(data['Phone'] ?? '')),
//                         DataCell(Text(data['Email'] ?? '')),
//                       ]);
//                     }).toList(),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method to build TextFormField widgets
//   Widget _buildTextFormField(
//       String label, 
//       String hint, 
//       TextEditingController controller, 
//       TextInputType keyboardType, 
//       String? Function(String?) validator) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//       ),
//       keyboardType: keyboardType,
//       validator: validator,
//     );
//   }

//   // Name validator: Only alphabets allowed
//   String? nameValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Name is required';
//     }
//     // Check if the name contains only alphabets (using regex)
//     if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
//       return 'Name should only contain alphabets';
//     }
//     return null;
//   }

//   // Phone validator: Only 10 digits allowed
//   String? phoneValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     // Check if the phone number contains exactly 10 digits
//     if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//       return 'Phone number must be 10 digits';
//     }
//     return null;
//   }

//   // Email validator: Must be a valid Gmail address
//   String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }
//     // Check if email contains @gmail.com
//     if (!value.endsWith('@gmail.com')) {
//       return 'Email must end with @gmail.com';
//     }
//     // Optional: Additional validation to check the format of email
//     if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
//       return 'Please enter a valid Gmail address';
//     }
//     return null;
//   }
// }
   
   
   
//    import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Text Widget Example")),
//         body: SafeArea(
//           child:Center(
//           child: Text(
//             "Hello, Flutter!",
//             style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Example')),
//         body:SafeArea(
//           child:  Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Above Space" ,
//               style: TextStyle(fontSize: 30, color: Colors.black45,fontWeight:FontWeight.bold ),),
//               SizedBox(height: 50), // Adds 20 pixels of vertical space
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text("Click Here"),
//               ),
//               SizedBox(height: 50), // Adds 30 pixels of vertical space
//               SizedBox(
//                 width: 200, // Sets width
//                 height: 50, // Sets height
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Fixed Size Button"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MaterialApp(
//     home: InkWellExample())
//     );
// }

// class InkWellExample extends StatelessWidget {
//   // Function to open Google
//   void hello() async {
//     var s = "https://www.google.com";
//     var url = s;
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw "Could not launch $url";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("InkWell Example")),
//       body: Center(
//         child: InkWell(
//           onTap: hello, // Open Google when tapped
//           child: Card(
//             color: Colors.blue,
//             elevation: 120,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 "Tap to Open Google",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Expanded with Flex in Column')),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 2, // Takes 2 parts of the available vertical space
//             child: Container(color: Colors.red),
//           ),
//           Expanded(
//             flex: 3, // Takes 1 part of the available vertical space
//             child: Container(color: Colors.green),
//           ),
//           Expanded(
//             flex: 1, // Takes 3 parts of the available vertical space
//             child: Container(color: Colors.blue),
//           ),
//         ],
//       ),
//     ),
//   ));
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: ImageExample()));
// }

// class ImageExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Image Example")),
//       body: Center(
//         child: Image.network(
//           'https://t4.ftcdn.net/jpg/05/43/06/33/360_F_543063338_ykf0De29YEwKMb2X4wktTwSQpE3uz8X5.jpg', // Image URL
//           width: 200, // Set width
//           height: 200, // Set height
//           fit: BoxFit.cover, // Adjust how image fits
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyForm()));
// }

// class MyForm extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stateless Widget with TextFormField")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _controller,
//               decoration: InputDecoration(labelText: "Enter your name"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 print("User Input: ${_controller.text}");
//               },
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(home: MyForm()));
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadData(); // Load saved input
//   }

//   // Function to save input
//   Future<void> _saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('saved_name', _controller.text);
//   }

//   // Function to load saved input
//   Future<void> _loadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _controller.text = prefs.getString('saved_name') ?? ''; // Restore text
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stateful Widget with Persistent Input")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _controller,
//               decoration: InputDecoration(labelText: "Enter your name"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _saveData(); // Save data when button is clicked
//                 print("User Input Saved: ${_controller.text}");
//               },
//               child: Text("Save Input"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }




// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(home: SharedPreferencesExample()));
// }

// class SharedPreferencesExample extends StatefulWidget {
//   @override
//   _SharedPreferencesExampleState createState() => _SharedPreferencesExampleState();
// }

// class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
//   final TextEditingController _nameController = TextEditingController();
//   String storedName = "No name saved";

//   Future<void> saveName() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', _nameController.text);
//     setState(() {
//       storedName = _nameController.text;
//     });
//   }

//   Future<void> getName() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       storedName = prefs.getString('username') ?? "No name saved";
//     });
//   }

//   Future<void> clearName() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('username');
//     setState(() {
//       storedName = "No name saved";
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getName(); // Load saved name on startup
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("SharedPreferences Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: "Enter Name"),
//             ),
//             SizedBox(height: 20),
//              ElevatedButton(onPressed: saveName, child: Text("Save Name")),
//               SizedBox(height: 20),
//             ElevatedButton(onPressed: getName, child: Text("Load Name")),
//              SizedBox(height: 20),
//             ElevatedButton(onPressed: clearName, child: Text("Clear Name")),
//             SizedBox(height: 20),
//             Text("Stored Name: $storedName"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: HomeScreen()));
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('FAB Example')),
//       body: Center(child: Text('Press the FAB!')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Action when FAB is pressed
//           print('FAB Clicked!');
//         },
//         child: Icon(Icons.add), // Icon inside the button
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyListView()));
// }

// class MyListView extends StatelessWidget {
//   final List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('ListView.builder Example')),
//       body: ListView.builder(
//         itemCount: names.length, // Number of items in the list
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.person), // Icon before text
//             title: Text(names[index]), // Display item from list
//             subtitle: Text('Person ${index + 1}'), // Subtitle
//             trailing: Icon(Icons.arrow_forward), // Icon at the end
//           );
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: AlertDialogExample()));
// }

// class AlertDialogExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('AlertDialog Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showAlertDialog(context);
//           },
//           child: Text('Show Alert'),
//         ),
//       ),
//     );
//   }

//   void _showAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Warning!'),
//           content: Text('Are you sure you want to continue?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close and take action
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: ResponsiveBox()));
// }

// class ResponsiveBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('LayoutBuilder Example')),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Center(
//             child: Container(
//               width: constraints.maxWidth * 0.4, // 50% of screen width
//               height: constraints.maxHeight * 0.3, // 30% of screen height
//               color: Colors.blue,
//               child: Center(child: Text('Adaptive Box', style: TextStyle(color: Colors.white))),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: ResponsiveUI()));
// }

// class ResponsiveUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Responsive UI')),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             return Center(child: Text('📱 Small Screen', style: TextStyle(fontSize: 24)));
//           } else {
//             return Center(child: Text('💻 Large Screen', style: TextStyle(fontSize: 24)));
//           }
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyListViewScreen(),
//   ));
// }

// class MyListViewScreen extends StatelessWidget {
//   final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter ListView Example')),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             // Small screen layout (Mobile)
//             return buildListView(context, crossAxisCount: 1);
//           } else {
//             // Large screen layout (Tablet)
//             return buildListView(context, crossAxisCount: 2);
//           }
//         },
//       ),
//     );
//   }

//   Widget buildListView(BuildContext context, {int crossAxisCount = 1}) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: ListTile(
//             title: Text(items[index]),
//             leading: Icon(Icons.arrow_forward),
//             onTap: () {
//               showAlertDialog(context, items[index]);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void showAlertDialog(BuildContext context, String item) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Item Selected"),
//           content: Text("You tapped on $item"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: TooltipExample()));
// }

// class TooltipExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Tooltip Example")),
//       body: Center(
//         child: Tooltip(
//           message: "This is an Info Icon",
//           child: Icon(Icons.info, size: 50),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyResponsiveScreen(),
//   ));
// }

// class MyResponsiveScreen extends StatelessWidget {
//   final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Responsive List/Grid View')),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             // Small screen layout (Mobile) - Grid View
//             return buildListView(context);
//           } else {
//             // Large screen layout (Tablet) - List View
//             return buildGridView(context);
//           }
//         },
//       ),
//     );
//   }

//   // GridView for small screens
//   Widget buildGridView(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(10),
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         mainAxisExtent: 100,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Tooltip( // Added Tooltip
//           message: "Tap to select ${items[index]}",
//           child: GestureDetector(
//             onTap: () => showAlertDialog(context, items[index]),
//             child: Card(
//               elevation: 3,
//               child: Center(
//                 child: Text(items[index], style: TextStyle(fontSize: 18)),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ListView for large screens
//   Widget buildListView(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Tooltip( // Added Tooltip
//           message: "Tap to select ${items[index]}",
//           child: Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text(items[index]),
//               leading: Icon(Icons.label),
//               onTap: () {
//                 showAlertDialog(context, items[index]);
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Function to show AlertDialog on item tap
//   void showAlertDialog(BuildContext context, String item) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Item Selected"),
//           content: Text("You tapped on $item"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }import 'package:flutter/material.dart';



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
  
//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void filterSearch(String query) {
//     setState(() {
//       filteredProducts = products
//           .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 labelText: "Search",
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (query) => filterSearch(query),
//             ),
//           ),
//           Expanded(
//             child: filteredProducts.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: Image.network(
//                             product['image'],
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                           title: Text(product['title']),
//                           subtitle: Text("Price: \$${product['price'].toString()}"),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.star, color: Colors.amber, size: 16),
//                               Text(product['rating']['rate'].toString()),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetail(product: product),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetail extends StatelessWidget {
//   final dynamic product;

//   ProductDetail({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['title'])),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(
//                 product['image'],
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               product['title'],
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text("Price: \$${product['price']}",
//                 style: TextStyle(fontSize: 20, color: Colors.green)),
//             SizedBox(height: 8),
//             Text(
//               product['description'],
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  

//   import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProduct(String query) {
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }

//     setState(() {
//       filteredProducts = products.where((product) => product['title'].toLowerCase() == query.toLowerCase()).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 labelText: "Search Product",
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     searchProduct(searchController.text);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: filteredProducts.isEmpty
//                 ? Center(child: Text("No products found"))
//                 : ListView.builder(
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: Image.network(
//                             product['image'],
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                           title: Text(product['title']),
//                           subtitle: Text("Price: \$${product['price'].toString()}"),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.star, color: Colors.amber, size: 16),
//                               Text(product['rating']['rate'].toString()),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailPage(product: product),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['title'])),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 13, 241, 21), fontWeight: FontWeight.normal)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//     searchController.addListener(() {
//       filterProducts(searchController.text);
//     });
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void filterProducts(String query) {
//     if (query.length < 3) {
//       setState(() {
//         filteredProducts = products;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }

//     setState(() {
//       filteredProducts = products
//           .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 labelText: "Search Product",
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: filteredProducts.isEmpty
//                 ? Center(child: Text("No products found"))
//                 : ListView.builder(
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: Image.network(
//                             product['image'],
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                           title: Text(product['title']),
//                           subtitle: Text("Price: \$${product['price'].toString()}"),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.star, color: Colors.amber, size: 16),
//                               Text(product['rating']['rate'].toString()),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailPage(product: product),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['title'])),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void filterProducts(String query) {
//     if (query.length < 3) {
//       setState(() {
//         filteredProducts = products;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }

//     setState(() {
//       filteredProducts = products
//           .where((product) => product['title'].toLowerCase().startsWith(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 labelText: "Search Product",
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.search),
//               ),
//               onChanged: filterProducts,
//             ),
//           ),
//           Expanded(
//             child: filteredProducts.isEmpty
//                 ? Center(child: Text("No products found"))
//                 : ListView.builder(
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: Image.network(
//                             product['image'],
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                           title: Text(product['title']),
//                           subtitle: Text("Price: \$${product['price'].toString()}"),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.star, color: Colors.amber, size: 16),
//                               Text(product['rating']['rate'].toString()),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailPage(product: product),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['title'])),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }
   







   
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//     searchController.addListener(() {
//       if (searchController.text.isEmpty) {
//         setState(() {
//           filteredProducts = products;
//         });
//       }
//     });
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProducts() {
//     String query = searchController.text.trim();
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }
    
//     setState(() {
//       isLoading = true;
//     });

//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         filteredProducts = products
//             .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       labelText: "Search Product",
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: searchProducts,
//                   child: Text("Search"),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : filteredProducts.isEmpty
//                     ? Center(child: Text("No products found"))
//                     : ListView.builder(
//                         itemCount: filteredProducts.length,
//                         itemBuilder: (context, index) {
//                           final product = filteredProducts[index];
//                           return Card(
//                             margin: EdgeInsets.all(8.0),
//                             child: ListTile(
//                               leading: Image.network(
//                                 product['image'],
//                                 width: 50,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                               ),
//                               title: Text(product['title']),
//                               subtitle: Text("Price: \$${product['price'].toString()}"),
//                               trailing: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.star, color: Colors.amber, size: 16),
//                                   Text(product['rating']['rate'].toString()),
//                                 ],
//                               ),
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ProductDetailPage(product: product),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product['title']),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }
  



//   import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//     searchController.addListener(() {
//       if (searchController.text.isEmpty) {
//         setState(() {
//           filteredProducts = products;
//         });
//       }
//     });
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProducts() {
//     String query = searchController.text.trim();
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }
    
//     setState(() {
//       isLoading = true;
//     });

//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         filteredProducts = products
//             .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       labelText: "Search Product",
//                       border: OutlineInputBorder(),
//                       suffixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: searchProducts,
//                   child: Text("Search"),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : filteredProducts.isEmpty
//                     ? Center(child: Text("No products found"))
//                     : GridView.builder(
//                         padding: EdgeInsets.all(8.0),
//                         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                           maxCrossAxisExtent: 200,
//                           mainAxisExtent: 300,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10, 
//                         ),
//                         itemCount: filteredProducts.length,
//                         itemBuilder: (context, index) {
//                           final product = filteredProducts[index];
//                           return GestureDetector(
//                             onTap: () {
//                               print("Selected Product: ${product['title']}, Price: \$${product['price']}");
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ProductDetailPage(product: product),
//                                 ),
//                               );
//                             },
//                             child: Card(
//                               elevation: 4,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Image.network(
//                                       product['image'],
//                                       fit: BoxFit.cover,
//                                       width: double.infinity,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       product['title'],
//                                       maxLines: 5,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                     child: Text("Price: \$${product['price']}",
//                                         style: TextStyle(color: Colors.green)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product['title']),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }
 



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
  
//   bool isLoading = false;
//   bool isGridView = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//     searchController.addListener(() {
//       if (searchController.text.isEmpty) {
//         setState(() {
//           filteredProducts = products;
//         });
//       }
//     });
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//         // print(products);
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProducts() {
//     String query = searchController.text.trim();
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }
    
//     setState(() {
//       isLoading = true;
//     });

//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         filteredProducts = products
//             .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       labelText: "Search Product",
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: searchProducts,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//                   onPressed: () {
//                     setState(() {
//                       isGridView = !isGridView;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : filteredProducts.isEmpty
//                     ? Center(child: Text("No products found"))
//                     : isGridView
//                         ? GridView.builder(
//                             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 200,
//                             mainAxisExtent: 300,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10, 
//                              ),
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                   print("Product Clicked: ${product['title']} - \$${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                                 child: Card(
//                                   child: Column(
//                                     children: [
//                                       Expanded(
//                                         child: Image.network(product['image'], fit: BoxFit.cover),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           children: [
//                                             Text(product['title'], maxLines: 1, overflow: TextOverflow.ellipsis),
//                                             Text("Price: \$${product['price']}", style: TextStyle(fontWeight: FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : ListView.builder(
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return ListTile(
//                                 leading: Image.network(
//                                   product['image'],
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 title: Text(product['title']),
//                                 subtitle: Text("Price: \$${product['price'].toString()}"),
//                                 trailing: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.star, color: Colors.amber, size: 16),
//                                     Text(product['rating']['rate'].toString()),
//                                   ],
//                                 ),
//                                 onTap: () {
//                                   print("Product Clicked: ${product['title']} - \$${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product['title']),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(product['image'], height: 200),
//             ),
//             SizedBox(height: 16),
//             Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }
  




// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;
//   bool isGridView = true;
//   String selectedCategory = "All";
//   List<String> categories = ["All", "electronics", "jewelery", "men's clothing", "women's clothing"];

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProducts() {
//     String query = searchController.text.trim();
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }
    
//     setState(() {
//       isLoading = true;
//     });

//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         filteredProducts = products
//             .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         isLoading = false;
//       });
//     });
//   }

//   void filterByCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//       if (category == "All") {
//         filteredProducts = products;
//       } else {
//         filteredProducts = products.where((product) => product['category'] == category).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       labelText: "Search Product",
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: searchProducts,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(Icons.filter_list),
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Filter by Category"),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: categories.map((category) {
//                               return ListTile(
//                                 title: Text(category),
//                                 onTap: () {
//                                   filterByCategory(category);
//                                   Navigator.pop(context);
//                                 },
//                               );
//                             }).toList(),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//                   onPressed: () {
//                     setState(() {
//                       isGridView = !isGridView;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : filteredProducts.isEmpty
//                     ? Center(child: Text("No products found"))
//                     : isGridView
//                         ? GridView.builder(
//                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 200,
//                              mainAxisExtent: 300,
//                              crossAxisSpacing: 10,
//                              mainAxisSpacing: 10, 
//                               ),
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                   print("Product Clicked: \${product['title']} - \$\${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                                 child: Card(
//                                   child: Column(
//                                     children: [
//                                       Expanded(
//                                         child: Image.network(product['image'], fit: BoxFit.cover),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           children: [
//                                             Text(product['title'], maxLines: 1, overflow: TextOverflow.ellipsis),
//                                             Text("Price: \$\${product['price']}", style: TextStyle(fontWeight: FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : ListView.builder(
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return ListTile(
//                                 leading: Image.network(
//                                   product['image'],
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 title: Text(product['title']),
//                                 subtitle: Text("Price: \$\${product['price'].toString()}"),
//                                 onTap: () {
//                                   print("Product Clicked: \${product['title']} - \$\${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});


 


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductList(),
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<dynamic> products = [];
//   List<dynamic> filteredProducts = [];
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;
//   bool isGridView = true;
//   String selectedCategory = "All";
//   List<String> categories = ["All", "electronics", "jewelery", "men's clothing", "women's clothing"];

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

//     if (response.statusCode == 200) {
//       setState(() {
//         products = json.decode(response.body);
//         filteredProducts = products;
//       });
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   void searchProducts() {
//     String query = searchController.text.trim();
//     if (query.length < 3) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter at least 3 characters to search")),
//       );
//       return;
//     }
    
//     setState(() {
//       isLoading = true;
//     });

//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         filteredProducts = products
//             .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//         isLoading = false;
//       });
//     });
//   }

//   void filterByCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//       if (category == "All") {
//         filteredProducts = products;
//       } else {
//         filteredProducts = products.where((product) => product['category'] == category).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Product List")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       labelText: "Search Product",
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: searchProducts,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(Icons.filter_list),
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Filter by Category"),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: categories.map((category) {
//                               return ListTile(
//                                 title: Text(category),
//                                 onTap: () {
//                                   filterByCategory(category);
//                                   Navigator.pop(context);
//                                 },
//                               );
//                             }).toList(),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(isGridView ? Icons.list : Icons.grid_view),
//                   onPressed: () {
//                     setState(() {
//                       isGridView = !isGridView;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : filteredProducts.isEmpty
//                     ? Center(child: Text("No products found"))
//                     : isGridView
//                         ? GridView.builder(
//                             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                              maxCrossAxisExtent: 200,
//                               mainAxisExtent: 300,
//                               crossAxisSpacing: 10,
//                               mainAxisSpacing: 10, 
//                                ),
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                   print("Product Clicked: \${product['title']} - \$\${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                                 child: Card(
//                                   child: Column(
//                                     children: [
//                                       Expanded(
//                                         child: Image.network(product['image'], fit: BoxFit.cover),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           children: [
//                                             Text(product['title'], maxLines: 1, overflow: TextOverflow.ellipsis),
//                                             Text("Price: \$\${product['price']}", style: TextStyle(fontWeight: FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : ListView.builder(
//                             itemCount: filteredProducts.length,
//                             itemBuilder: (context, index) {
//                               final product = filteredProducts[index];
//                               return ListTile(
//                                 leading: Image.network(
//                                   product['image'],
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 title: Text(product['title']),
//                                 subtitle: Text("Price: \$\${product['price'].toString()}"),
//                                 onTap: () {
//                                   print("Product Clicked: \${product['title']} - \$\${product['price']}");
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => ProductDetailPage(product: product),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailPage extends StatelessWidget {
//   final dynamic product;
//   ProductDetailPage({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['title'])),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(product['image'], height: 200),
//             SizedBox(height: 10),
//             Text("Price: \$\${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text(product['description']),
//           ],
//         ),
//       ),
//     );
//   }
// }

  

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> products = [];
  List<dynamic> filteredProducts = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool isGridView = true;
  String selectedCategory = "All";
  List<String> categories = ["All", "electronics", "jewelery", "men's clothing", "women's clothing"];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
        filteredProducts = products;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  void searchProducts() {
    String query = searchController.text.trim();
    setState(() {
      filteredProducts = products
          .where((product) => product['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == "All") {
        filteredProducts = products;
      } else {
        filteredProducts = products.where((product) => product['category'] == category).toList();
      }
    });
  }

  Future<void> downloadProductDetails(dynamic product) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Product: ${product['title']}", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text("Price: \$${product['price']}", style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 10),
            pw.Text("Description: ${product['description']}"),
          ],
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName = product['title'].replaceAll(RegExp(r'[^\w\s]+'), '_');
    final file = File("${directory.path}/${fileName}.pdf");
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloaded: ${file.path}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: Column(
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
                        onPressed: searchProducts,
                      ),
                    ),
                  ),
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
                            children: categories.map((category) {
                              return ListTile(
                                title: Text(category),
                                onTap: () {
                                  filterByCategory(category);
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(isGridView ? Icons.list : Icons.grid_view),
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : filteredProducts.isEmpty
                    ? Center(child: Text("No products found"))
                    : isGridView
                        ? GridView.builder(
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 300,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10, 
                            ),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(product['image'], fit: BoxFit.cover),
                                    ),
                                    ListTile(
                                      title: Text(product['title'], maxLines: 1, overflow: TextOverflow.ellipsis),
                                      subtitle: Text("Price: \$${product['price']}"),
                                      trailing: IconButton(
                                        icon: Icon(Icons.download),
                                        onPressed: () => downloadProductDetails(product),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return ListTile(
                                leading: Image.network(
                                  product['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product['title']),
                                subtitle: Text("Price: \$${product['price']}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.download),
                                  onPressed: () => downloadProductDetails(product),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailPage(product: product),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final dynamic product;
  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image'], height: 200),
            SizedBox(height: 10),
            Text("Price: \$${product['price']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(product['description']),
          ],
        ),
      ),
    );
  }
}
