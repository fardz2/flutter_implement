// ignore: file_names

import 'package:coba/tab/homePageTab/allItems.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 5, animationDuration: Duration.zero);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Welcome",
                      style: GoogleFonts.encodeSans(
                          textStyle: const TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Albert Stevano",
                      style: GoogleFonts.encodeSans(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/250?image=9"),
                  radius: 30,
                )
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: TextField(
                  style: GoogleFonts.encodeSans(
                      textStyle: const TextStyle(fontSize: 20)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Search clothes',
                      prefixIcon: const Icon(Icons.search)),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 68,
                    width: 60,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                      child: const Icon(
                        Icons.filter_3_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          padding: const EdgeInsets.all(1),
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
                child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0, color: Colors.grey),
                  color: selectedIndex == 0 ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Icon(Icons.send_rounded,
                      color: selectedIndex == 0 ? Colors.white : Colors.black),
                  Text(
                    'All Items',
                    style: TextStyle(
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            )),
            Tab(
                child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0, color: Colors.grey),
                  color: selectedIndex == 1 ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Icon(Icons.send_rounded,
                      color: selectedIndex == 1 ? Colors.white : Colors.black),
                  Text(
                    'Dress',
                    style: TextStyle(
                        color:
                            selectedIndex == 1 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            )),
            Tab(
                child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0, color: Colors.grey),
                  color: selectedIndex == 2 ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Icon(Icons.send_rounded,
                      color: selectedIndex == 2 ? Colors.white : Colors.black),
                  Text(
                    'All Items',
                    style: TextStyle(
                        color:
                            selectedIndex == 2 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            )),
            Tab(
                child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0, color: Colors.grey),
                  color: selectedIndex == 3 ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Icon(Icons.send_rounded,
                      color: selectedIndex == 3 ? Colors.white : Colors.black),
                  Text(
                    'All Items',
                    style: TextStyle(
                        color:
                            selectedIndex == 3 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            )),
            Tab(
                child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0, color: Colors.grey),
                  color: selectedIndex == 4 ? Colors.black : Colors.white),
              child: Row(
                children: [
                  Icon(Icons.send_rounded,
                      color: selectedIndex == 4 ? Colors.white : Colors.black),
                  Text(
                    'All Items',
                    style: TextStyle(
                        color:
                            selectedIndex == 4 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            )),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              AllItems(),
              Text("faridz"),
              Text("fdz"),
              Text("Niama"),
              Text("fardz")
            ],
          ),
        ))
      ],
    );
  }
}
