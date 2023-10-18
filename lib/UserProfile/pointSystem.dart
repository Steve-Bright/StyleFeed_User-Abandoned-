import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PointSystem extends StatefulWidget {
  const PointSystem({super.key});

  @override
  State<PointSystem> createState() => _PointSystemState();
}

class _PointSystemState extends State<PointSystem> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context, '/userHome');
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Point System')
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('My Rewards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,)),
                ]
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text('Current Points', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2,)),

                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 100, right: 100),
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: Text('3000', style: TextStyle(color: Colors.white, fontSize: 60)),
                      )
                    ]
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 30,),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(228, 246, 248, 50),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text('Benefits', style: TextStyle(color: Colors.lightBlue)),
                    )
                  ) ,

                  SizedBox(
                    height: 30,
                  ),

                  TabBar(
                    tabs: [
                      Tab(
                        child: Center(child: Text('Rewards', style: TextStyle(color: Colors.black)))
                      ),
                      Tab(
                        child: Center(child: Text('All', style: TextStyle(color: Colors.black)))
                      ),
                      Tab(
                        child: Center(child: Text('History', style: TextStyle(color: Colors.black)))
                      )
                    ]
                  ),

                  Container(
                    height: 480,
                    // color: Colors.red,
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Hot Right Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),

                                      InkWell(
                                        onTap: (){
                                        },
                                        child: Text(
                                         'More >',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                                        )
                                      )
                                    ],
                                  ),
                                ),

                                for(int i = 0; i < 5; i++)
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black, width: 2.0)
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image.asset('assets/rewards/hotpot.jpg'),
                                        margin: EdgeInsets.all(10),
                                        width: 100,
                                        height: 100,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Delicious Pizza', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,)),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: 17,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            SizedBox(height: 30),
                                            Text('Discount 30%')
                                          ]
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Text('Points: 100', style: TextStyle(color: Colors.white)),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                            TextButton(
                                                child: Text('Redeem'),
                                                onPressed: (){
                                                }
                                            )
                                          ]
                                        )
                                      )
                                    ]
                                  )
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Text('this is All Tab')
                          ),
                          Container(
                            child: Text('this is History Tab')
                          )
                        ]
                      ),
                  )
                ]
              )
            )
          ]
        )
      ),
    );
  }
}
