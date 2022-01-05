import 'package:flutter/material.dart';
import 'package:carbnb/screen_arguments/insurance_screen_args.dart';

class InsuranceElem extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String description;

  const InsuranceElem(
      {Key? key,
      required this.imageUrl,
      required this.brand,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: const Color(0x8185BF78),
      clipBehavior: Clip.antiAlias,
      // shadowColor: const Color(0xFF212121),
      // shadowColor: constant.defaultColor,
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(imageUrl),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Center(
            child: Text(
              brand,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            height: 5,
            thickness: 1,
            // indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          Text(description),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pushNamed(context, '/insuranceDetails',
                      arguments:
                          InsuranceScreenArgs(brand, description, imageUrl));
                },
                child: const Text("Read More"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/splash');
                  },
                  child: const Text("Select"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
