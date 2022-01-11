import 'package:flutter/material.dart';
import 'uility_ui.dart' as utilUI;

class RowNewsCard extends StatelessWidget {
  RowNewsCard({Key? key, required this.rowList}) : super(key: key);
  final List<dynamic> rowList;

  @override
  Widget build(BuildContext context) {
    return rowList.length == 0
        ? const CircularProgressIndicator()
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              utilUI.ReusableCard(
                padding: 0,
                margin: const {"left": 20, "right": 0, "bottom": 10, "top": 0},
                circularRadius: 15,
                cardBGColor: Colors.white60,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Stack(children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/productPage',
                            arguments: {"product_id": rowList[0]["_id"]});
                      },
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(rowList[0]["image_url"]),
                      ),
                    ),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.08,
                        left: MediaQuery.of(context).size.height * 0.01,
                        child: Text(
                          rowList[0]["brand"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.height * 0.01,
                        child: Text(
                          rowList[0]["name"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ]),
                ),
              ),
              utilUI.ReusableCard(
                padding: 0,
                margin: {
                  "left": MediaQuery.of(context).size.width * 0.22,
                  "right": 0,
                  "bottom": 10,
                  "top": 0
                },
                circularRadius: 15,
                cardBGColor: Colors.white60,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Stack(children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/productPage',
                            arguments: {"product_id": rowList[1]["_id"]});
                      },
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(rowList[1]["image_url"]),
                      ),
                    ),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.08,
                        left: MediaQuery.of(context).size.height * 0.01,
                        child: Text(
                          rowList[1]["brand"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.height * 0.01,
                        child: Text(
                          rowList[1]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ))
                  ]),
                ),
              ),
            ],
          );
  }
}
