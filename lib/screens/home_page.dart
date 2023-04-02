import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindr/remindr_theme.dart';
import 'package:remindr/screens/authentication_screen.dart';
import 'package:remindr/services/authentication.dart';

import '../models/user.dart';
import '../tools.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/home-page";

  Column buildHomeButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RemindrHomeButton(title: "Se connecter", onPressed: (){
          AuthService().logout();
        },),
        const SizedBox(height: 20,),
        RemindrHomeButton(title: "S'inscrire", onPressed: (){
          Navigator.pushNamed(context, AuthenticationScreen.routeName);
        },),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ReminderUser?>(context);
    if(user == null) {
      return const AuthenticationScreen();
    }
    return buildReminderGradientScaffold(
        context: context,
        appBarTitle: "Home",
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: RemindrMaterialTheme.getGradientBackground(context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        )
    );
  }
}