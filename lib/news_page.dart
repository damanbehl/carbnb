import 'package:flutter/material.dart';
import 'components/uility_ui.dart' as utilUI;
import 'constant.dart' as constant;
import 'components/radio_button.dart' as RBD;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
            Positioned(
                top: 80,
                left: 20,
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
          ],
        ),
        // utilUI.ReusableCard(
        //   padding: 0,
        //   margin: {"left": 0, "right": 0, "bottom": 0, "top": 50},
        //   circularRadius: 10,
        //   cardBGColor: constant.defaultColor,
        //   child: ,
        // ),
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
}
