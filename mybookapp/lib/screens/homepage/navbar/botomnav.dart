import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybookapp/screens/bidspage/bids.dart';
import 'package:mybookapp/screens/cartpage/cart.dart';
import 'package:mybookapp/screens/createaccount/usermodel/usermod.dart';
import 'package:mybookapp/screens/homepage/home.dart';
import 'package:mybookapp/screens/userprofilepage/profile.dart';

class BotoomNav extends StatefulWidget {
 final UserCredential userCredential;
 final UserModel userMod;

  const BotoomNav({super.key, required this.userCredential, required this.userMod});
  @override
  _BotoomNavState createState() => _BotoomNavState();
}
class _BotoomNavState extends State<BotoomNav> {
  int _currentIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      HomePage(),
      Bids(),
      Cart(),
      UserProfile(userModel: widget.userMod),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey.shade700,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: "Bids",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
