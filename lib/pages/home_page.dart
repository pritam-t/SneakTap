import 'package:SneakTap/pages/cart_page.dart';
import 'package:SneakTap/widgets/product_list.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  }

  class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    ProductList(),
    CartPage(),
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
          FocusScope.of(context).unfocus();
          setState(() {
            currentPage = value;
          });
        },
        iconSize: 25,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor:Colors.black ,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded,),
              label: 'Cart',
          ),
        ],
      ),
    );
  }
}
