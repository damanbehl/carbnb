import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'constant.dart' as constant;
import 'components/insurance_elem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/uility_ui.dart' as utilUI;

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  static int offset = 3;
  final ScrollController _sc = ScrollController();
  bool isLoading = false;
  List<dynamic> insuranceArr = [];

  @override
  void initState() {
    _getAPIData(0);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        // print("am I constantly going to fetch data");
        _getAPIData(0);
      }
    });
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
        leading: const BackButton(color: Colors.white),
        title: const Text("Insurance"),
        appBar: AppBar(),
        actions: const [],
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: insuranceArr.length + 1,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == insuranceArr.length) {
          // print("end of data");
          return _buildProgressIndicator();
        } else {
          return InsuranceElem(
              price: insuranceArr[index]["price"],
              imageUrl: insuranceArr[index]['image_url'],
              brand: insuranceArr[index]["brand"],
              description: insuranceArr[index]["description"],
              key: Key(insuranceArr[index]["_id"]));
        }
      },
      controller: _sc,
    );
  }

  Future<Map<String, dynamic>> delayAddingInsurances() => Future.delayed(
        const Duration(seconds: 1),
        () => {"body": constant.insuranceAPIData, "statusCode": "200"},
      );

  void _getMoreData(int offset) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      final response = await delayAddingInsurances();
      if (response["statusCode"] == "200") {
        // print("got data");
        var responseData =
            convert.jsonDecode(response["body"]) as List<dynamic>;
        // print("Type of response after decoding is >" +
        //     responseData.runtimeType.toString());
        setState(() {
          isLoading = false;
          insuranceArr.addAll(responseData);
          offset = offset + 3;
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
            FirebaseFirestore.instance.collection('insurance');
        QuerySnapshot querySnapshot = await _collectionRef.get();
        // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
        var singleElem;
        final allData = querySnapshot.docs.map((doc) {
          singleElem = doc.data() as Map<String, dynamic>;
          singleElem["image_url"] =
              utilUI.generateImageUrl(singleElem["imageString"]);
          singleElem["_id"] = doc.reference.id;
          return singleElem;
        }).toList();
        print(allData[0].toString());
        setState(() {
          isLoading = false;
          insuranceArr.addAll(allData);
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
    // print("constantly rendering loader");
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 0,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
