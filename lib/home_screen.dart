import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'constant.dart' as constant;
import 'components/car_elem.dart';
import 'components/uility_ui.dart' as utilUI;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/common_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int offset = 10;
  final ScrollController _sc = ScrollController();
  bool isLoading = false;
  List<dynamic> cars = [];
  String filter = "";

  @override
  void initState() {
    // _getMoreData(offset);
    super.initState();
    print("going to initialize state");

    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        // _getMoreData(offset);
        _getAPIData(0);
      }
    });
  }

  @override
  void didChangeDependencies() {
    _getAPIData(0);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: utilUI.homeLeading,
        title: const Text(""),
        appBar: AppBar(),
        actions: utilUI.homeActions,
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: cars.length + 1,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (BuildContext context, int index) {
          if (index == cars.length) {
            print("going to load more data");
            return _buildProgressIndicator();
          } else {
            print('Rendering');
            return CarElem(
                key: Key(cars[index]['_id']),
                id: cars[index]['_id'],
                heading: cars[index]['name'],
                subHeading: cars[index]['brand'],
                cardImage: cars[index]['image_url'],
                price: cars[index]['price_numerical'],
                supportingText: cars[index]['description']);
          }
        },
        controller: _sc);
  }

  Future<Map<String, dynamic>> delayAddingCars() =>
      // Imagine that this function is more complex and slow.
      Future.delayed(
        const Duration(seconds: 1),
        () => {"body": constant.carAPIData, "statusCode": "200"},
      );

  // void _getAPData(int offset) async {
  //   if (!isLoading) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     var url = Uri.parse(constant.apiUrl + offset.toString());
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var responseData =
  //           convert.jsonDecode(response.body) as List<Map<String, dynamic>>;
  //       setState(() {
  //         isLoading = false;
  //         cars.addAll(responseData);
  //         offset = offset + 10;
  //       });
  //     }
  //     else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   }
  // }

  void _getAPIData(int offset) async {
    var args = {};
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    }

    filter = args["type"] ?? "";
    print("filter gotten" + filter);
    try {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        CollectionReference _collectionRef =
            FirebaseFirestore.instance.collection('cars');
        QuerySnapshot querySnapshot;
        if (filter != "" && filter.length > 0) {
          querySnapshot =
              await _collectionRef.where('type', isEqualTo: filter).get();
        } else {
          querySnapshot = await _collectionRef.get();
        }
        // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
        var singleElem;
        final allData = querySnapshot.docs.map((doc) {
          singleElem = doc.data() as Map<String, dynamic>;
          singleElem["image_url"] =
              utilUI.generateImageUrl(singleElem["main_image"]);
          singleElem["_id"] = doc.reference.id.toString();
          return singleElem;
        }).toList();
        print(allData[0].toString());
        setState(() {
          isLoading = false;
          cars.addAll(allData);
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

  void _getMoreData(int offset) async {
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
          offset = offset + 10;
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
