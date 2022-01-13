// import 'package:carbnb/components/news_card.dart';
import 'package:carbnb/components/row_news_card.dart';
import 'package:flutter/material.dart';
import 'components/uility_ui.dart' as utilUI;
import 'constant.dart' as constant;
import 'dart:convert' as convert;
import 'components/radio_button.dart' as RBD;
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;
  List<dynamic> cars = [];
  List<dynamic> cardList = [];
  String filter = "";

  @override
  void initState() {
    _getAPIData(0);
    super.initState();
  }

  Future<Map<String, dynamic>> delayAddingCars() =>
      // Imagine that this function is more complex and slow.
      Future.delayed(
        const Duration(seconds: 1),
        () => {"body": constant.carAPIData, "statusCode": "200"},
      );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: constant.defaultColor,
                image: const DecorationImage(
                  image: AssetImage('assets/images/homescreen.jpg'),
                  fit: BoxFit.cover,
                ),
                // border: Border.all(
                //   color: constant.defaultColor,
                //   width: 8,
                // ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              child: const Text(
                "CARBNB",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              top: MediaQuery.of(context).size.height * 0.15,
              right: 20,
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 10,
                width: MediaQuery.of(context).size.width * 0.50,
                height: 40,
                child: utilUI.ReusableCard(
                    padding: 10,
                    margin: const {
                      "top": 0,
                      "right": 0,
                      "left": 0,
                      "bottom": 0
                    },
                    cardBGColor: constant.defaultColor,
                    circularRadius: 15,
                    key: const Key("searchModal"),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: const Text(
                        "Cars, Trucks and SUV's..",
                        style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                      onTap: () async {
                        filter = await _openSelectionFilters(context);
                      },
                    ))),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.22,
                // left: 20,
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.width * 0.50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: cars.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == cars.length) {
                        print("going to load more data");
                        return _buildProgressIndicator();
                      } else {
                        print('Rendering');
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/productPage',
                                arguments: {"product_id": cars[index]["_id"]});
                          },
                          child: Image(
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.90,
                              image: NetworkImage(cars[index]['image_url'])),
                        );
                      }
                    })),
            Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.40,
                height: 40,
                child: ElevatedButton(
                  child: const Text("Search"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search',
                        arguments: {"type": filter});
                  },
                )),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.13,
              child: RowNewsCard(
                  rowList: cardList.isNotEmpty ? cardList.sublist(0, 2) : []),
            )
          ],
        ),
        RowNewsCard(rowList: cardList.isNotEmpty ? cardList.sublist(2, 4) : []),
        RowNewsCard(rowList: cardList.isNotEmpty ? cardList.sublist(4) : [])
      ],
    ));
  }

  Future<String> _openSelectionFilters(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                  // maxWidth: MediaQuery
                  //     .of(context)
                  //     .size
                  //     .width * 0.75
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: RBD.RadioButton(),
                )),
          );
        });
  }

  void _getMoreData() async {
    // print('inside get more data');
    if (!isLoading) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
      });
      final response = await delayAddingCars();
      // print("status code is " + response["statusCode"]);
      // print("length of object is" + response["body"].length.toString());
      if (response["statusCode"] == "200") {
        var responseData =
            convert.jsonDecode(response["body"]) as List<dynamic>;
        // print("Type of response after decoding is >" +
        //     responseData.runtimeType.toString());
        if (!mounted) return;
        setState(() {
          isLoading = false;
          cars.addAll(responseData);
        });
      } else {
        print('Request failed with status: ${response["statusCode"]}.');
      }
    }
  }

  void _getAPIData(int offset) async {
    try {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        CollectionReference _collectionRef =
            FirebaseFirestore.instance.collection('cars');
        QuerySnapshot querySnapshot = await _collectionRef.limit(10).get();
        // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
        var singleElem;
        final allData = querySnapshot.docs.map((doc) {
          singleElem = doc.data() as Map<String, dynamic>;
          singleElem["image_url"] =
              utilUI.generateImageUrl(singleElem["main_image"]);
          singleElem["_id"] = doc.reference.id.toString();
          return singleElem;
        }).toList();
        final sliderList = allData.sublist(0, 4);
        final second = allData.sublist(4);
        setState(() {
          isLoading = false;
          cars.addAll(sliderList);
          cardList.addAll(second);
          // offset = offset + 10;
        });
      }
    } catch (e) {
      print(e);
    }

    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData);
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
            opacity: isLoading ? 1.0 : 0,
            child: const CircularProgressIndicator()),
      ),
    );
  }
}
