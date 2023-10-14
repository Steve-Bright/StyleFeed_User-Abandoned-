import 'package:flutter/material.dart';

class FilterDetail extends StatefulWidget {
  const FilterDetail({super.key});

  @override
  State<FilterDetail> createState() => _FilterDetailState();
}

class _FilterDetailState extends State<FilterDetail> {
  List<bool> isColorClicked = List.generate(6, (index)=> false);
  List<bool> isSizeClicked = List.generate(6, (index)=> false);
  List<bool> isCategoryClicked = List.generate(6, (index)=> false);

  double _currentSliderValue = 30000;

  List<Color> colorlist = [
    Colors.black, Colors.white, Colors.blue, Colors.green, Colors.brown, Colors.yellow, Colors.cyan,
  ];

  List<String> fashionSizes = [
    "XS", "S", "M", "L", "XL"
  ];

  List<String> categories = [
    "All", "Man", "Woman", "Children", "Streetwear", "Footwear",
  ];

  void _colorTap(int index){
    setState((){
      isColorClicked[index] = !isColorClicked[index];
    });
  }

  void _sizeTap(int index){
    setState((){
      isSizeClicked[index] = !isSizeClicked[index];
    });
  }

  void _categoryTap(int index){
    setState((){
      isCategoryClicked[index] = !isCategoryClicked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 740,
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.only(left: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text("Filter",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Price Range',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Starting From ${_currentSliderValue.round()} kyats', style: TextStyle(color: Colors.black))
              ),
              Slider(
                value: _currentSliderValue,
                max: 500000,
                // divisions: 10,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Color',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(padding: EdgeInsets.only(top: 1),
                  child: Row(children:
                  List.generate(6, (int i){
                    return  GestureDetector(
                      onTap: (){
                        _colorTap(i);
                      },
                      child: Container(

                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          color: colorlist[i],
                          border: isColorClicked[i] ? Border.all(color: Colors.blue, width: 2.0) : null,
                        ),
                      ),
                    );
                  }
                  )
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.centerLeft,
                  child: Text('Sizes',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(padding: EdgeInsets.only(top: 1),
                  child: Row(children:
                  List.generate(5, (int i){
                    return  GestureDetector(
                      onTap: (){
                        _sizeTap(i);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('${fashionSizes[i]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(8),
                        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          // border: isSizeClicked[i] ? Border.all(color: Colors.blue, width: 2.0) : null,
                          color: isSizeClicked[i] ? Colors.yellow : Colors.transparent,
                          border: Border.all(color: Colors.black, width: 1.0)
                        ),
                      ),
                    );
                  }
                  )
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.centerLeft,
                  child: Text('Category',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(padding: EdgeInsets.only(top: 1),
                  child: Row(children:
                  List.generate(6, (int i){
                    return  GestureDetector(
                      onTap: (){
                        _categoryTap(i);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('${categories[i]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        height: 40,
                        width: 80,
                        margin: EdgeInsets.all(8),
                        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          // border: isSizeClicked[i] ? Border.all(color: Colors.blue, width: 2.0) : null,
                            color: isCategoryClicked[i] ? Colors.yellow : Colors.transparent,
                            border: Border.all(color: Colors.black, width: 1.0)
                        ),
                      ),
                    );
                  }
                  )
                  ),
                ),
              ),


            ],
          ),
        ),

        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: (){},
                  child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                ),
              ),
              Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: (){},
                  child: Text('Apply', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                ),
              )
            ]
          )
        )
      ],
    );
  }
}
