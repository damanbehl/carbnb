import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';
import 'data_model/insurance_screen_args.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarInsuranceDescription extends StatelessWidget {
  const CarInsuranceDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as InsuranceScreenArgs;
    return Scaffold(
      appBar: CommonAppBar(
          title: const Text('Car Insurance Details'),
          leading: const SizedBox(),
          appBar: AppBar(),
          actions: const []),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(args.imageString),
                          fit: BoxFit.fill)),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(30.0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      Text(args.description),
                      Text(
                        "Price\$ \t" + args.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _getButton(
                                  buttonText: 'Back',
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: _getButton(
                                  buttonText: 'Select',
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString(
                                        'insurance_id', args.id);
                                    await prefs.setString(
                                        'insurance_price', args.price);
                                    Navigator.pushNamed(context, '/splash',
                                        arguments: {"direction": "forward"});
                                  }),
                              flex: 1,
                            ),
                          ])
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _getButton({String? buttonText, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        child: Text(
          buttonText ?? '',
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
