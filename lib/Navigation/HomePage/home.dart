import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CategoriesWidget.dart';
import 'ItemWidget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../navigationBar.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STYLE FEED", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black,)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.person))],
      ),

      
      body: ListView(children: [
        //HomeAppBar(),
        Container(
          //height: 500,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Color(0xFFEDECF2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
          )
        ),
        child: Column(children: [
          //search
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here...."
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/searchResults');
                },
                icon: Icon(
                  Icons.search,
                  size: 27,
                )
              )
            ],),
          ),

          //Categories

        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        child: Text(
          "Categories",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ),
        CategoriesWidget(),


        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Text("Best Selling",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
        ),
        //items
        ItemWidget()
        ],
        ),
        ),
      ],
      ),
      bottomNavigationBar: MyButtonNav(),
    );
  }
}