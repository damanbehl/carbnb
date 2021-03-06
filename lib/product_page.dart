import 'package:carbnb/components/uility_ui.dart';
import 'package:flutter/material.dart';
import 'constant.dart' as constant;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isLoading = false;
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  var productData = {};
  Color selectedColor = Colors.blue;
  var isFavourite = false;
  String productId = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      productId = args["product_id"] ?? "";
      getCar(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Opacity(
                opacity: isLoading ? 1.0 : 0,
                child: const CircularProgressIndicator()),
          )
        : Scaffold(
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
              Text(productData["type"] ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 16)),
              Text(productData["type"] != null ? productData["name"] : "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24))
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
          // Image.asset(imagePath[colors.indexOf(selectedColor)]),
          productData["images_array"] != null
              ?
          // Image(
          //         image:
          //         NetworkImage(generateImageUrl(
          //             productData["images_array"]
          //                 [colors.indexOf(selectedColor)])
          //         ),
          //       )
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: generateImageUrl(
                          productData["images_array"]
                              [colors.indexOf(selectedColor)]),
          )
              : CircularProgressIndicator(),
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            productData["description"] ?? "",
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
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
              Text("Image no",
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
                                : SizedBox(
                                    child: Text(index.toString()),
                                  ),
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
              Text(productData["price_tag_line"] ?? "",
                  style: TextStyle(
                      color: constant.productBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              const SizedBox(height: 10),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  color: constant.productBodyColor.withOpacity(0.10),
                  child: const Text(
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
              child: const Text(
                "Add to WishList +",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('product_id', productId);
                await prefs.setString(
                    'car_price', productData["price_numerical"]);
                Navigator.pushNamed(context, '/insurancePage', arguments: {
                  "product_id": productId,
                  "car_price": productData["price_numerical"]
                });
              },
              child: const Text("Rent This car")),
          Text(productData["price_tag_line"] ?? "",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12))
        ],
      ),
    );
  }

  void getCar(String id) async {
    var data;
    try {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        await FirebaseFirestore.instance
            .collection('cars')
            .doc(id)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            data = documentSnapshot.data();
            // print("did the data model work" + data["name"]);
            // print('Document data: ${documentSnapshot.data()}');
          } else {
            data = {"error": "document_id not found"};
            print('Document does not exist on the database');
          }
        });
        setState(() {
          isLoading = false;
          productData = data;
          // offset = offset + 10;
        });
      }
    } catch (e) {
      print("error caught in catch line 236" + e.toString());
    }
  }
}
