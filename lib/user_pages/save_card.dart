import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Perform action
              },
            ),
          ],
        ),
        body: CardDetail(),
        bottomNavigationBar: MyButtonNav()
    );
  }
}


//card detail
class CardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: CardItem(),
                ),
                Expanded(
                  child: CardItem(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardItem(),
                ),
                Expanded(
                  child: CardItem(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardItem(),
                ),
                Expanded(
                  child: CardItem(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardItem(),
                ),
                Expanded(
                  child: CardItem(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardItem(),
                ),
                Expanded(
                  child: CardItem(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 200.0,
          ),
          SizedBox(height: 10.0),
          Text(
            'Image 1 Heading',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Sub_heading'),
        ],
      ),
    );
  }
}

// class bottomAppbar extends StatelessWidget {
//   const bottomAppbar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {
//               // Navigate to home screen or perform other actions.
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Perform search operation.
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               // Navigate to settings screen or perform other actions.
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.card_giftcard),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cardpage');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyButtonNav extends StatelessWidget {
  const MyButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25
          ),
          child: GNav (
            iconSize: 25,
            onTabChange: (index){
              print(index);
            },
            color: Colors.black,
            activeColor: Colors.black,
            padding: EdgeInsets.all(20),
            tabs: [
              GButton(icon: Icons.home,),
              GButton(icon: Icons.favorite,),
              GButton(icon: Icons.cabin, onPressed: (){ Navigator.pushNamed(context, '/cart');}),
              GButton(icon: Icons.message, ),
            ],
          ),
        ),

    );
  }
}
