import 'package:flutter/material.dart';


int quantity_count = 0;

void incrementValue(){
    quantity_count ++;

}

void decrementValue(){
    quantity_count --;
}

final List<Container> assetPaths = [
  Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Image.asset('assets/items/lacoste.jpg', width: 150, height: 120),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: InkWell(
                              onTap: (){},
                              child: Text('Item Name')
                          )

                      ),
                      SizedBox(
                          height: 30,
                          child: Text('30,000 Kyats')
                      ),
                      SizedBox(
                          height: 30,
                          child: Row(
                              children: <Widget>[
                                Text('Qty: '),
                                IconButton(
                                    onPressed: (){
                                      decrementValue();
                                    },
                                    icon: Icon(Icons.remove)
                                ),
                                Text(
                                    '$quantity_count'
                                ),
                                IconButton(
                                    onPressed: (){
                                      incrementValue();
                                    },
                                    icon: Icon(Icons.add)
                                )
                              ]
                          )
                      ),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                      onPressed: (){},
                                      child: Text('Delete')
                                  )
                                ]
                          )

                      ),
                    ]
                ),
                // Text('item bla bla bla')
              ]
          ),

          Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 0,
              color: Colors.black
          )
        ]
      ),
  ),

  Container(
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Image.asset('assets/items/lacoste.jpg', width: 150, height: 120),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: InkWell(
                              onTap: (){},
                              child: Text('Item Name')
                          )

                      ),
                      SizedBox(
                          height: 30,
                          child: Text('30,000 Kyats')
                      ),
                      SizedBox(
                          height: 30,
                          child: Row(
                              children: <Widget>[
                                Text('Qty: '),
                                IconButton(
                                    onPressed: (){
                                      decrementValue();
                                    },
                                    icon: Icon(Icons.remove)
                                ),
                                Text(
                                    '$quantity_count'
                                ),
                                IconButton(
                                    onPressed: (){
                                      incrementValue();
                                    },
                                    icon: Icon(Icons.add)
                                )
                              ]
                          )
                      ),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Delete')
                                )
                              ]
                          )

                      ),
                    ]
                ),
                // Text('item bla bla bla')
              ]
          ),

          Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 0,
              color: Colors.black
          )
        ]
    ),
  ),

  Container(
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Image.asset('assets/items/lacoste.jpg', width: 150, height: 120),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: InkWell(
                              onTap: (){},
                              child: Text('Item Name')
                          )

                      ),
                      SizedBox(
                          height: 30,
                          child: Text('30,000 Kyats')
                      ),
                      SizedBox(
                          height: 30,
                          child: Row(
                              children: <Widget>[
                                Text('Qty: '),
                                IconButton(
                                    onPressed: (){
                                      decrementValue();
                                    },
                                    icon: Icon(Icons.remove)
                                ),
                                Text(
                                    '$quantity_count'
                                ),
                                IconButton(
                                    onPressed: (){
                                      incrementValue();
                                    },
                                    icon: Icon(Icons.add)
                                )
                              ]
                          )
                      ),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Delete')
                                )
                              ]
                          )

                      ),
                    ]
                ),
                // Text('item bla bla bla')
              ]
          ),

          Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 0,
              color: Colors.black
          )
        ]
    ),
  ),

  Container(
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Image.asset('assets/items/lacoste.jpg', width: 150, height: 120),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: InkWell(
                              onTap: (){},
                              child: Text('Item Name')
                          )

                      ),
                      SizedBox(
                          height: 30,
                          child: Text('30,000 Kyats')
                      ),
                      SizedBox(
                          height: 30,
                          child: Row(
                              children: <Widget>[
                                Text('Qty: '),
                                IconButton(
                                    onPressed: (){
                                      decrementValue();
                                    },
                                    icon: Icon(Icons.remove)
                                ),
                                Text(
                                    '$quantity_count'
                                ),
                                IconButton(
                                    onPressed: (){
                                      incrementValue();
                                    },
                                    icon: Icon(Icons.add)
                                )
                              ]
                          )
                      ),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Delete')
                                )
                              ]
                          )

                      ),
                    ]
                ),
                // Text('item bla bla bla')
              ]
          ),

          Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 0,
              color: Colors.black
          )
        ]
    ),
  ),

  Container(
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Image.asset('assets/items/lacoste.jpg', width: 150, height: 120),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: InkWell(
                              onTap: (){},
                              child: Text('Item Name')
                          )

                      ),
                      SizedBox(
                          height: 30,
                          child: Text('30,000 Kyats')
                      ),
                      SizedBox(
                          height: 30,
                          child: Row(
                              children: <Widget>[
                                Text('Qty: '),
                                IconButton(
                                    onPressed: (){
                                      decrementValue();
                                    },
                                    icon: Icon(Icons.remove)
                                ),
                                Text(
                                    '$quantity_count'
                                ),
                                IconButton(
                                    onPressed: (){
                                      incrementValue();
                                    },
                                    icon: Icon(Icons.add)
                                )
                              ]
                          )
                      ),
                      SizedBox(
                          width: 200,
                          height: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Delete')
                                )
                              ]
                          )

                      ),
                    ]
                ),
                // Text('item bla bla bla')
              ]
          ),

          Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 0,
              color: Colors.black
          )
        ]
    ),
  ),

];