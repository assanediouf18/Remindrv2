import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../remindr_theme.dart';

class RemindrHomeButton extends StatelessWidget {

  final String title;
  final Function onPressed;

  const RemindrHomeButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => { onPressed() },
      child: Text(title),
      style: RemindrMaterialTheme.myButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        fixedSize: MaterialStateProperty.all(const Size(200, 30)),
      ),
    );
  }
}