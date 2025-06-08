import 'package:SneakTap/global_variables.dart';
import 'package:SneakTap/pages/product_details_page.dart';
import 'package:SneakTap/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Bacca Bucci',
    'Comet',
    'Nike',
    'Redtape',
    'Zaydn',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(80),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(10),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/inapplogo.png',
                    height: 150,
                    width: 180,
                  ),
                  // child: Text("Shoes\nCollection",
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search_outlined),
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40, // Slightly increased for better tap UX
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                physics: const BouncingScrollPhysics(), // Optional: smoother scroll
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter == filter;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromRGBO(245, 247, 249, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color.fromRGBO(191, 185, 185, 1.0),
                            ),
                          ),
                          child: Text(
                            filter,
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


            Expanded(
              child:
                  size.width > 650
                      ? GridView.builder(
                         itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.5
                            ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'] as String,
                              price: product['price'] as int,
                              image: product['imageURL'] as String,
                              backgroundcolor:
                                  index.isEven
                                      ? const Color.fromRGBO(216, 240, 253, 1)
                                      : const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        },
                      )
                      : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetailsPage(product: product);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: product['title'] as String,
                              price: product['price'] as int,
                              image: product['imageURL'] as String,
                              backgroundcolor:
                                  index.isEven
                                      ? const Color.fromRGBO(216, 240, 253, 1)
                                      : const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
