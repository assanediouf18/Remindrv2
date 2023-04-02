import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:remindr/services/authentication.dart';

import '../remindr_theme.dart';
import '../utils/gradient_scaffold.dart';
import '../utils/home_button.dart';
import 'home_page.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const String routeName = "/home-page/authentication";

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningIn = true;
  bool _passwordChecked = false;
  String password = "";
  String email = "";
  String redirectionSentence = "", redirectionQuestion = "", actionButtonText = "";
  AuthService auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _updateActionText() {
    if(isSigningIn) {
      actionButtonText = "Se Connecter";
      redirectionSentence = "Créer un compte";
      redirectionQuestion = "Tu n'as pas de compte ?";
    } else {
      actionButtonText = "S'inscrire";
      redirectionSentence = "Se connecter";
      redirectionQuestion = "Tu as déjà un compte ?";
    }
  }

  Future _connectUser() async {
    isSigningIn ? await auth.signInWithEmailPassword(email, password) :
    await auth.registerWithEmailPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    _updateActionText();
    return buildReminderGradientScaffold(
        context: context,
        appBarTitle: actionButtonText,
        body: Container(
          decoration: RemindrMaterialTheme.getGradientBackground(context),
          padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: RemindrMaterialTheme.appInputDecoration.copyWith(hintText: "Adresse email"),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if(value == null) return;
                    if(EmailValidator.validate(value)) {
                      email = value;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  obscureText: true,
                  decoration: RemindrMaterialTheme.appInputDecoration.copyWith(hintText: "Mot de passe"),
                  onChanged: (value) => password = value,
                  controller: _passwordController,
                ),
                FlutterPwValidator(
                    width: 400,
                    height: 50,
                    minLength: 8,
                    onSuccess: () {
                      _passwordChecked = true;
                    },
                    onFail: () {
                      _passwordChecked = false;
                    },
                    controller: _passwordController,
                ),
                const SizedBox(height: 32,),
                RemindrHomeButton(title: actionButtonText, onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate() && (_passwordChecked || isSigningIn)) {
                    await _connectUser();
                  }
                }),
                RemindrHomeButton(title: "Annuler", onPressed: (){
                  Navigator.popAndPushNamed(context, HomePage.routeName);
                }),
                const SizedBox(height: 8.0,),
                Center(child: Text(redirectionQuestion)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isSigningIn = !isSigningIn;
                    });
                  },
                  child: Text(
                    redirectionSentence,
                    style: TextStyle(
                      color: RemindrMaterialTheme.getColor(context, nullableColor: Colors.yellow),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
