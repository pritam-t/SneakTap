import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cart Page 1")),
      ),
       body: ListView.builder(
           itemCount: cart.length,
           itemBuilder: (context,index){
             final cartItem = cart[index];

             return Padding(
               padding: const EdgeInsets.all(10.0),
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundImage: AssetImage(cartItem['imageURL']as String),
                   radius: 30,
                 ),
                 trailing: IconButton(
                   onPressed: (){
                   showDialog(
                     barrierDismissible: false,
                       context: context, builder: (context){
                     return AlertDialog(
                       title: Text('Delete Product',style: Theme.of(context).textTheme.titleMedium),
                       content: Text('Are you sure to remove your ${cartItem['title']} from the cart ?'),
                       actions: [
                         TextButton(onPressed: (){Navigator.of(context).pop();},
                             child: const Text('No',
                               style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                         ),
                         TextButton(
                             onPressed: (){Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                               Navigator.of(context).pop();},
                             child: const Text('Yes',
                               style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                         ),
                       ],
                     );
                   });
                 },
                   iconSize: 30,
                   icon: const Icon(Icons.delete_outline),color: Colors.red,),
                 title: Text(
                   cartItem['title'].toString(),
                   style: Theme.of(context).textTheme.bodyLarge,
                 ),
                 subtitle:  Text('Size: ${cartItem['sizes']}'),
               ),
             );
           })
    );
  }
}
