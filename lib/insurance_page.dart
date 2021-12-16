import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'constant.dart' as constant;
import 'components/insurance_elem.dart';

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
    _getMoreData(offset);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        // print("am I constantly going to fetch data");
        _getMoreData(offset);
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
              imageUrl: insuranceArr[index]['image_url'],
              brand: insuranceArr[index]["brand"],
              description: insuranceArr[index]["description"],
              key: Key(insuranceArr[index]["reference_number"]));
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
