import 'package:flutter/material.dart';
import 'rewards.dart';
import 'allPoint.dart';

class PointSystem extends StatefulWidget {
  const PointSystem({super.key});

  @override
  State<PointSystem> createState() => _PointSystemState();
}

class _PointSystemState extends State<PointSystem> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                        child: Text('3,000', style: TextStyle(color: Colors.white, fontSize: 60)),
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
                      child: Text('View Benefits', style: TextStyle(color: Colors.lightBlue)),
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
                        child: Center(child: Text('Points History', style: TextStyle(color: Colors.black)))
                      ),
                    ]
                  ),

                  Container(
                    height: 480,
                    // color: Colors.red,
                      child: TabBarView(
                        children: [
                          RewardsTab(),
                          AllTab()
                        ]
                      ),
                  ),

                ]
              )
            ),
          ]
        )
      ),
    );
  }
}
