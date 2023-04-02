import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:remindr/tools.dart';

import '../remindr_theme.dart';
import 'home_page.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const String routeName = "/home-page/authentication";

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isSigningIn = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildReminderGradientScaffold(
        context: context,
        appBarTitle: isSigningIn ? "Se connecter" : "S'inscrire",
        body: Container(
          decoration: RemindrMaterialTheme.getGradientBackground(context),
          padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: RemindrMaterialTheme.appInputDecoration.copyWith(hintText: "Adresse email"),
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  decoration: RemindrMaterialTheme.appInputDecoration.copyWith(hintText: "Mot de passe"),
                ),
                RemindrHomeButton(title: "Se connecter", onPressed: (){}),
                RemindrHomeButton(title: "Annuler", onPressed: (){
                  Navigator.popAndPushNamed(context, HomePage.routeName);
                }),
              ],
            ),
          ),
        )
    );
  }
}
