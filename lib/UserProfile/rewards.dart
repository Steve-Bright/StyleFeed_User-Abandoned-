import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RewardsTab extends StatefulWidget {
  const RewardsTab({super.key});

  @override
  State<RewardsTab> createState() => _RewardsTabState();
}

class _RewardsTabState extends State<RewardsTab> {
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
    );
  }
}
