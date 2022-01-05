
import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';

class CarInsuranceDescription extends StatelessWidget {
  final String imageString;
  final String? title;
  final String? description;

  const CarInsuranceDescription({Key? key, required this.imageString, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: const Text('Car Insaurance Description'), leading: const SizedBox(), appBar: AppBar(), actions: const []),
      body: SafeArea(
        child: Column(
          children: 
          [
            Expanded(
              flex: 7,
              child: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage((imageString != '' && imageString != null) ? imageString : 'https://imgd.aeplcdn.com/0x0/n/cw/ec/52565/hector-exterior-right-front-three-quarter-3.jpeg'), fit: BoxFit.fill)),)),
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
                    Text((title != '' && title != null) ? title! : 'Hector', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
                    Text((description != '' && description != null) ? description! : 'Elegant and Beautiful'),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children : [
                        Expanded(child: _getButton(buttonText: 'Back', onTap: (){}), flex: 1,),
                        const SizedBox(width: 10,),
                        Expanded(child: _getButton(buttonText: 'Next', onTap: (){}), flex: 1,),
                      ]
                    )
                  ],
                ),
              )),
          ],
        ),
      ),
    );
  }

  Widget _getButton({String? buttonText, Function? onTap})
  {
    return InkWell(
      onTap: (){onTap;},
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(18.0))),
        child: Text(buttonText ?? '', style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
  }
}