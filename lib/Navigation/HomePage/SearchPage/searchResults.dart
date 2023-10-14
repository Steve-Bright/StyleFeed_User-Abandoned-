import 'package:flutter/material.dart';
import 'searchedItems.dart';
import 'package:side_sheet/side_sheet.dart';
import 'filterDetail.dart';

//option reference
//https://api.flutter.dev/flutter/material/PopupMenuButton-class.html

enum SampleItem { filter1, filter2, filter3, filter4, filter5 }

class searchResults extends StatefulWidget {
  const searchResults({super.key});

  @override
  State<searchResults> createState() => _searchResultsState();
}

class _searchResultsState extends State<searchResults> {
  double _currentSliderValue = 30000;

  List<String> sortOptions = [
    "Best Match",
    "From Lowest Price",
    "From Highest Price",
    "From Recently added",
    "Distance: Nearest"
  ];
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)
        ),
        actions: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 50),
              padding: EdgeInsets.only(bottom: 5),
              width: 290,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here...."
                ),
              ),
            ),
            IconButton(
                onPressed: (){
                },
                icon: Icon(
                  Icons.search,
                  size: 27,
                )
            )
        ]
      ),
      body:
          Column(
            children: <Widget>[
              Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton<SampleItem>(
                        initialValue: selectedMenu,
                        // Callback that sets the selected popup menu item.
                        onSelected: (SampleItem item) {
                          setState(() {
                            selectedMenu = item;
                          }
                          );
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.filter1,
                            child: Text('Best Match'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.filter2,
                            child: Text('From Lowest Price'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.filter3,
                            child: Text('From Highest Price'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.filter4,
                            child: Text('From Recently added'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.filter5,
                            child: Text('Distance: Nearest'),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: (){
                          SideSheet.right(
                              width: MediaQuery.of(context).size.width * 0.65,
                              body: FilterDetail(),
                              context: context
                          );
                        },
                        icon: Icon(Icons.filter_alt_off_outlined),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text("Search Results for Item Name",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SearchedItems(),
                  ]
                ),
              ),
              ],
          ),

    );
  }
}
