import 'package:flutter/material.dart';

import 'package:style_feed/Navigation/navigationBar.dart';
import '../HomePage/ItemWidget.dart';
import 'wishListItems.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Perform action
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                wishListItems(),
              ]
            )
          ],
        ),
        bottomNavigationBar: MyButtonNav()
    );
  }
}

//card detail
// class CardDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Saved',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 50.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: CardItem(),
//                 ),
//                 Expanded(
//                   child: CardItem(),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CardItem(),
//                 ),
//                 Expanded(
//                   child: CardItem(),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CardItem(),
//                 ),
//                 Expanded(
//                   child: CardItem(),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CardItem(),
//                 ),
//                 Expanded(
//                   child: CardItem(),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: CardItem(),
//                 ),
//                 Expanded(
//                   child: CardItem(),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CardItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3.0,
//       child: Column(
//         children: [
//           Container(
//             color: Colors.grey,
//             height: 200.0,
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'Image 1 Heading',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text('Sub_heading'),
//         ],
//       ),
//     );
//   }
// }
