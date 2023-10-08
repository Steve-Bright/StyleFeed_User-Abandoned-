import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  final int cartIndex;
  final String imageString;
  final String productName;
  final int price;
  final int initialQuantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  CartItemCard({
    required this.cartIndex,
    required this.imageString,
    required this.productName,
    required this.price,
    required this.initialQuantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text('${widget.cartIndex}'),
              Padding(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  widget.imageString,
                  width: 150,
                  height: 150,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                  widget.onDecrease();
                                }
                              });
                            },
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                                widget.onIncrease();
                              });
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          widget.onRemove();
                        },
                      ),
                    ],
                  ),
                  Text('${quantity*widget.price}',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
