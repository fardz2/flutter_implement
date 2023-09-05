import 'package:coba/page/AboutPage.dart';
import 'package:coba/page/HomePage.dart';
import 'package:coba/page/ProfilePage.dart';
import 'package:coba/page/SearchPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    ProfilePage(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(children: [
          _widgetOptions[selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurStyle: BlurStyle.normal,
                      blurRadius: 25,
                      offset:
                          const Offset(1, -25), // changes position of shadow
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(selectedIndex == 0
                            ? Icons.home
                            : Icons.home_outlined),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(selectedIndex == 1
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(selectedIndex == 2
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(selectedIndex == 3
                            ? Icons.person
                            : Icons.person_outline),
                      ),
                      label: 'Home',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  backgroundColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  elevation: 1,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
