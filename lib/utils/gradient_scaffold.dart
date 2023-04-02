import 'package:flutter/material.dart';
import '../remindr_theme.dart';

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