import 'package:SneakTap/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsize = 0;
  void onTap()
  {
    if(selectedsize!=0)
      {
        Provider.of<CartProvider>(context,listen: false).addProduct({
          'id': widget.product['id'],
          'title':  widget.product['title'],
          'price': widget.product['price'],
          'imageURL': widget.product['imageURL'],
          'company': widget.product['company'],
          'sizes': selectedsize,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product Added Successfully')),
        );
      }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Select a size')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Column(
          children: [
            Text(widget.product['title'] as String,style: Theme.of(context).textTheme.titleLarge ,),
            const Spacer(flex: 1,),
            Center(child: Image.asset(widget.product['imageURL']as String)),
            const Spacer(flex: 2,),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('INR: ${widget.product['price']}',style: TextTheme.of(context).titleLarge,),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 50 ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context,index){
                        final size = (widget.product['sizes']as List<int>)[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedsize =size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString(),),
                              backgroundColor: selectedsize == size? Theme.of(context).colorScheme.primary:null,
                            ),
                          ),
                        );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      style:  ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      icon: const Icon(Icons.shopping_cart, color: Colors.black),
                      label: const Text('Add to Cart', style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
