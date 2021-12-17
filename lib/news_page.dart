import 'package:carbnb/components/news_card.dart';
import 'package:flutter/material.dart';
import 'components/uility_ui.dart' as utilUI;
import 'constant.dart' as constant;
import 'dart:convert' as convert;
import 'components/radio_button.dart' as RBD;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;
  List<dynamic> cars = [];

  @override
  void initState() {
    _getMoreData();
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
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
              height: MediaQuery.of(context).size.height * 0.75,
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
            const Positioned(
              child: Text(
                "CARBNB",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              top: 80,
              right: 20,
            ),
            Positioned(
                top: 80,
                left: 10,
                width: 200,
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
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _openSelectionFilters(context);
                      },
                    ))),
            Positioned(
                top: 120,
                // left: 20,
                width: 400,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: cars.length + 1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == cars.length) {
                        print("going to load more data");
                        return _buildProgressIndicator();
                      } else {
                        print('Rendering');
                        return Image(
                            image: NetworkImage(cars[index]['image_url']));
                      }
                    })),
            Positioned(
                bottom: 80,
                left: 80,
                width: 200,
                height: 40,
                child: ElevatedButton(
                  child: const Text("Search"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                )),
            Positioned(
              bottom: 150,
              child: const NewsCard(),
            )
          ],
        ),
        const NewsCard(),
        const NewsCard()
      ],
    ));
  }

  _openSelectionFilters(context) {
    showDialog(
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
        setState(() {
          isLoading = false;
          cars.addAll(responseData);
        });
      } else {
        print('Request failed with status: ${response["statusCode"]}.');
      }
    }
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
