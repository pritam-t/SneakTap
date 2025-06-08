import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final Color backgroundcolor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundcolor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
       decoration: BoxDecoration(
           color: backgroundcolor,
           borderRadius: BorderRadius.circular(25.0)
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(title,style: Theme.of(context).textTheme.titleMedium,),
           const SizedBox(height: 5,),
           Text('INR: $price',style: Theme.of(context).textTheme.titleSmall,),
           const SizedBox(height: 5,),
           Center(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: SizedBox(
                 width: 320, // Fixed width
                 height: 200, // Fixed height
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0),
                   child: Image.asset(
                     image,
                     fit: BoxFit.cover, // Ensures image fills the box and gets cropped if needed
                   ),
                 ),
               ),
             ),
           )
         ],
       ),

    );
  }
}
