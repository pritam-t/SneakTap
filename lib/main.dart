import 'package:SneakTap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartProvider(),
      child: MaterialApp(
        title: "SneakTap",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1),primary: Color.fromRGBO(254, 206, 1, 1)),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20, color: Colors.black,
            )
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,),
            titleMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),
            titleSmall: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
          ),
          useMaterial3: true,
        ),

        // home: const CartPage(),
        home: const HomePage(),
        // home: ProductDetailsPage(
        //   product: products[0],
        // ),
      ),
    );
  }
}
