import 'package:carbnb/constant.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  Color textColor;
  Function onChange;

  InputField(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.textColor,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            headerText,
            style: TextStyle(
                color: textColor, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              onChanged: (value) {
                onChange(value);
              },
              decoration: InputDecoration(
                  hintText: hintTexti, border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;
  Color textColor;
  Function onChange;

  InputFieldPassword(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.textColor,
      required this.onChange})
      : super(key: key);

  @override
  _InputFieldPasswordState createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            widget.headerText,
            style: TextStyle(
                color: widget.textColor,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              obscureText: _visible,
              onChanged: (value) {
                widget.onChange(value);
              },
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _visible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class TopText extends StatelessWidget {
  final String text;

  const TopText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_sharp,
                color: whiteshade,
                size: 40,
              )),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(color: whiteshade, fontSize: 25),
          )
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isCheck;

  @override
  void initState() {
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade,
              activeColor: defaultColor,
              onChanged: (val) {
                setState(() {
                  //TODO: CALLBACK TO PARENT AND GENERALISE THIS
                  isCheck = val!;
                });
              }),
          Text.rich(TextSpan(
              text: "Remember Me",
              style:
                  TextStyle(color: grayshade.withOpacity(0.8), fontSize: 16)))
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key? key,
      required this.child,
      required this.margin,
      required this.padding,
      required this.cardBGColor,
      required this.circularRadius})
      : super(key: key);

  final Widget child;
  final Map<String, double> margin;
  final double padding;
  final Color cardBGColor;
  final double circularRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(margin),
      margin: EdgeInsets.fromLTRB(
          margin["left"]!, margin["top"]!, margin["right"]!, margin["bottom"]!),
      padding: EdgeInsets.all(padding),
      child: child,
      decoration: BoxDecoration(
          color: cardBGColor,
          borderRadius: BorderRadius.circular(circularRadius)),
    );
  }
}

List<Widget> homeActions = <Widget>[
  IconButton(
      onPressed: () {
        //WILL CONTROL API QUERY FROM HERE SOMEHOW
        print('ADD SORTING');
      },
      icon: const Icon(
        Icons.sort,
        size: 40,
      ))
];

Image homeLeading =
    const Image(image: AssetImage('assets/images/menu_icon.jpg'));

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validatePssword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
