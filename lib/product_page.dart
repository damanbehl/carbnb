import 'package:flutter/material.dart';
import 'constant.dart' as constant;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  List<String> imagePath = [
    "assets/images/mazdasix.jpg",
    "assets/images/mazdasixside.jpg",
    "assets/images/mazdasix_boot.jpg",
    "assets/images/mazdasixback.jpg"
  ];
  Color selectedColor = Colors.blue;
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          header(),
          hero(),
          Expanded(child: section()),
          bottomButton()
        ],
      ),
    ));
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/back_button.png"),
          ),
          Column(
            children: [
              Text("Premium Cars",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
              Text("Alfa Romeo",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24))
            ],
          ),
          // Image.asset(
          //   "assets/images/bag_button.png",
          //   height: 34,
          //   width: 34,
          // ),
        ],
      ),
    );
  }

  Widget hero() {
    return Container(
      child: Stack(
        children: [
          Image.asset(imagePath[colors.indexOf(selectedColor)]),
          Positioned(
              bottom: 10,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: Image.asset(
                  isFavourite
                      ? "assets/images/heart_icon.png"
                      : "assets/images/heart_icon_disabled.png",
                  height: 34,
                  width: 34,
                ),
              ))
        ],
      ),
    );
  }

  Widget section() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Optional, Manufacturers locking wheel nuts \$71 OMVIC \$10 Environmental fee \$20 Federal air conditioning levy \$100"
            " Included in selling price Selling price plus PPSA fee (lien registration) "
            "HST & licensingBay Mazda is South-Eastern Ontarios number one Mazda dealer."
            " We pride ourselves on customer service and the best experience you will have in"
            " a car dealership anywhere. Try Bay Mazda today for your best selection of New Mazda vehicles. 60 Millennium Pkwy Belleville. ",
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: constant.productBodyColor, fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 20),
          property()
        ],
      ),
    );
  }

  Widget property() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color",
                  style: TextStyle(
                      color: constant.productBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Row(
                children: List.generate(
                    4,
                    (index) => GestureDetector(
                          onTap: () {
                            print("index $index clicked");
                            setState(() {
                              selectedColor = colors[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(right: 10),
                            height: 34,
                            width: 34,
                            child: selectedColor == colors[index]
                                ? Image.asset("assets/images/checker.png")
                                : SizedBox(),
                            decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.circular(17)),
                          ),
                        )),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lease type",
                  style: TextStyle(
                      color: constant.productBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  color: constant.productBodyColor.withOpacity(0.10),
                  child: Text(
                    "Daily Rent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
              onPressed: () {},
              child: Text(
                "Add to WishList +",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/insurancePage');
          }, child: Text("Rent This car")),
          Text(r"$95",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28))
        ],
      ),
    );
  }
}
