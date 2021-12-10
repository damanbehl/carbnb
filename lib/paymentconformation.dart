import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class paymentconformation extends StatefulWidget {
  const paymentconformation({Key? key}) : super(key: key);

  @override
  _paymentconformationState createState() => _paymentconformationState();
}

class _paymentconformationState extends State<paymentconformation> {
  double iconSize = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Conformation'),
        ),
        body:Center(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                  children: [
                    TableRow( children: [
                      Column(children:[
                        Icon(Icons.account_box, size: iconSize,),
                        const Text('My Account')
                      ]),
                      Column(children:[
                        Icon(Icons.settings, size: iconSize,),
                        const Text('Settings')
                      ]),
                      Column(children:[
                        Icon(Icons.lightbulb_outline, size: iconSize,),
                        const Text('Ideas')
                      ]),
                    ]),
                    TableRow( children: [
                      Icon(Icons.cake, size: iconSize,),
                      Icon(Icons.voice_chat, size: iconSize,),
                      Icon(Icons.add_location, size: iconSize,),
                    ]),
                  ],
                ),
              ),
            ]))),

      );
  }
}
