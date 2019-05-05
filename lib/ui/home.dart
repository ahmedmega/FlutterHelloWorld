import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: Colors.deepOrange,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      sayHello(),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'FjallaOne',
                          fontWeight: FontWeight.w700),
                    )),
                    Expanded(
                        child: Text(
                      "Hi",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'FjallaOne',
                          fontWeight: FontWeight.w700),
                    ))
                  ],
                ),
                PizzaImageWidget(),
                OrderButton(),
              ],
            )));
  }

  String sayHello() {
    var hello;
    var date = DateTime.now();
    var hour = date.hour;
    if (hour < 12) hello = "Good Morning";
    if (hour < 18)
      hello = "Good Afternoon";
    else
      hello = "Good Evening";
    String time =
        "${date.hour.toString()}:${date.minute.toString().padLeft(2, '0')}";
    var result = hello + ",\n It's " + time;
    return result;
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza1.png');
    Image image = Image(
      image: pizzaAsset,
      width: 200.0,
      height: 200.0,
    );
    return image;
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        child: Text("Order Your Pizza!"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: () {
          order(context);
        },
      ),
    );

    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Ordr Completed"),
      content: Text("Thanks for your Order"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context)=> alert
    );
  }
}
