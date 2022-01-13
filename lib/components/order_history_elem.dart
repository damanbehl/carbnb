import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'uility_ui.dart' as UUI;

class OrderHistoryElem extends StatefulWidget {
  final Map<String, dynamic> orderElem;

  const OrderHistoryElem({Key? key, required this.orderElem}) : super(key: key);

  @override
  _OrderHistoryElemState createState() => _OrderHistoryElemState();
}

class _OrderHistoryElemState extends State<OrderHistoryElem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: FutureBuilder<Map<String, dynamic>>(
        future: getCarRented(widget.orderElem["car_id"]),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                );
              } else {
                String image_url =
                    UUI.generateImageUrl(snapshot.data!["main_image"] ?? "");
                String transaction_id =
                    widget.orderElem["transaction_id"] ?? "";
                String name = snapshot.data!["name"];
                Timestamp date_rented = widget.orderElem["date_rented"];
                String product_id = widget.orderElem["car_id"];
                return carCard(
                    product_id, name, date_rented, image_url, transaction_id);
              }
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getCarRented(String carId) async {
    var returnValue;
    try {
      await FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          returnValue = documentSnapshot.data();
          // print("did the data model work" + data["name"]);
          // print('Document data: ${documentSnapshot.data()}');
        } else {
          returnValue = {"error": "document_id not found"};
          print('Document does not exist on the database');
        }
      });
      return returnValue;
    } catch (e) {
      rethrow;
    }
  }

  Widget carCard(String product_id, String name, Timestamp db, String image_url,
      String transcation_id) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            subtitle: Text("Rented at> " + db.toDate().toString()),
          ),
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: NetworkImage(image_url),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(transcation_id),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('Rent again'),
                onPressed: () async {
                  Navigator.pushNamed(context, '/productPage',
                      arguments: {"product_id": product_id});
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
