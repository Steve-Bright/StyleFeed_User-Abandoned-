import 'package:flutter/material.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latest Point History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),

                InkWell(
                    onTap: (){
                    },
                    child: Text(
                        'Detail >',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    )
                )
              ],
            ),
          ),

          for(int i = 0; i < 3; i++)
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.white24, width: 2.0)
            ),
            child: Row(
              children: [
                Container(
                  width: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    // borderRadius: BorderRadius.circular(5)
                  )
                ),

                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order ID - 5B203C', style: TextStyle(fontSize: 22)),
                      Text('18/10/2023')
                    ]
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  child: Text('+200', style: TextStyle(color: Colors.green, fontSize: 30))
                )
              ]
            )
          )
        ]
      )
    );
  }
}
