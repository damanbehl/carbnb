import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Text title;
  final List<Widget> actions;
  final Widget leading;

  const CommonAppBar(
      {Key? key,
      required this.title,
        required this.leading,
      required this.appBar,
      required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
