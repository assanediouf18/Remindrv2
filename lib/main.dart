import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:remindr/screens/authentication_screen.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindr/remindr_theme.dart';
import 'package:remindr/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'services/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remindr',
      theme: ThemeData(
        primarySwatch: RemindrMaterialTheme.remindrpalette,
        fontFamily: GoogleFonts.lora().fontFamily,
        textTheme: TextTheme(
          headline1: GoogleFonts.bubblerOne().copyWith(
            fontSize: 70,
          ),
          headline2: GoogleFonts.bubblerOne().copyWith(
            fontSize: 50,
          ),
          headline3: GoogleFonts.bubblerOne().copyWith(
            fontSize: 40,
          ),
          bodyText1: GoogleFonts.lora().copyWith(
            fontWeight: FontWeight.w400,
          )
        )
      ),
      routes: {
        HomePage.routeName : (context) => StreamProvider<ReminderUser?>(
          initialData: null,
          create: (context) => AuthService().user,
          child: const HomePage(),
        ),
        AuthenticationScreen.routeName : (context) => const AuthenticationScreen(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
