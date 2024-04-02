// import 'package:car_app/model/item_model.dart';
// import 'package:flutter/material.dart';

// import '../screens/product_screen.dart';

// class ItemCard extends StatelessWidget {
//   final Item item;

//   const ItemCard({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10, left: 10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 150,
//             child: Stack(
//               children: [
//                 InkWell(
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.asset(
//                         item.image,
//                         fit: BoxFit.contain,
//                         width: 150,
//                         height: 250,
//                       )),
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ProductScreen(item:,)));
//                   },
//                 ),
//                 Positioned(
//                   right: 10,
//                   top: 10,
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: const Center(
//                       child: Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             item.name,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//           ),
//           Row(
//             children: [
//               Icon(
//                 Icons.thumb_up,
//                 color: Colors.blue[200],
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 item.likes.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               const Icon(
//                 Icons.monetization_on,
//                 color: Colors.green,
//               ),
//               Text(
//                 item.price.toString(),
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.red),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
