import 'package:flutter/material.dart';

class CarElem extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String cardImage;
  final String supportingText;

  const CarElem(
      {Key? key,
      required this.heading,
      required this.subHeading,
      required this.cardImage,
      required this.supportingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subHeading),
            trailing: const Icon(Icons.favorite_outline),
          ),
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: NetworkImage(cardImage),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('Contact Agent'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Learn More'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
