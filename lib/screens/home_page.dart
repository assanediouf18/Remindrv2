import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindr/screens/authentication_screen.dart';
import 'package:remindr/services/authentication.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> pageTitles = ["Aujourd'hui", "Tous les rappels"];

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "All",
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ReminderUser?>(context);
    if (user == null) {
      return const AuthenticationScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            pageTitles[_selectedIndex],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Déconnection"),
                      content: const Text("Es-tu sûr de vouloir te déconnecter ?"),
                      actions: [
                        TextButton(
                          child: const Text("Non"),
                          onPressed: () {
                            Navigator.pop(context);
                            },
                        ),
                        TextButton(
                          child: const Text("Oui"),
                          onPressed: () {
                            AuthService().logout();
                            Navigator.pop(context);
                          },
                        )
                      ],
                      elevation: 0.5,
                    ),
                );
              },
              icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}