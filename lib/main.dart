import 'package:flutter/material.dart';
import 'package:my_app/screens/detail_page.dart';
import 'package:my_app/screens/product_list_screen.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';
  
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
          initialRoute: '/',
    onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/': (BuildContext context) => const ProductListScreen(),
          '/details': (BuildContext context) =>  ProductDetailPage(
            product_id: settings.arguments as String,
          ),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
      ),
    ),
  );
}






