import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:remindr/remindr_theme.dart';

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

Scaffold buildReminderGradientScaffold({required BuildContext context, required appBarTitle, required Widget body}) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        appBarTitle,
        style: RemindrMaterialTheme.getTextStyle(
            context,
            nullableTextStyle: Theme.of(context).textTheme.headline1
        ).copyWith(color: Colors.white, fontSize: 60),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.transparent,
    ),
    body: body,
  );
}