import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';
import '../screens/images/images_screen.dart';
import '../screens/prompt/prompt_screen.dart';

List<String> sizeList = <String>['1:1', '2:2', '3:3', '4:4'];

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PromptScreen(),
    ImagesScreen(),
    Center(
      child: Text(
        'Saved',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Premium',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ConstImages.logo,
                    width: Get.width * 0.4,
                  ),
                  Image.asset(
                    ConstImages.pro,
                    height: Get.height * 0.03,
                  )
                ],
              ),
            ),
          )),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              ConstImages.prompt,
              height: Get.height * 0.04,
              width: Get.width * 0.09,
              color: _selectedIndex == 0
                  ? const Color(0xffE1485D)
                  : const Color(0xff666666),
            ),
            label: 'Prompt',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ConstImages.image,
                height: Get.height * 0.04,
                width: Get.width * 0.09,
                color: _selectedIndex == 1
                    ? const Color(0xffE1485D)
                    : const Color(0xff666666)),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ConstImages.save,
                height: Get.height * 0.04,
                width: Get.width * 0.09,
                color: _selectedIndex == 2
                    ? const Color(0xffE1485D)
                    : const Color(0xff666666)),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ConstImages.crown,
                height: Get.height * 0.04,
                width: Get.width * 0.09,
                color: _selectedIndex == 3
                    ? const Color(0xffE1485D)
                    : const Color(0xff666666)),
            label: 'Premuim',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ConstImages.setting,
                height: Get.height * 0.04,
                width: Get.width * 0.09,
                color: _selectedIndex == 4
                    ? const Color(0xffE1485D)
                    : const Color(0xff666666)),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffE1485D),
        unselectedItemColor: const Color(0xff666666),
        unselectedLabelStyle: const TextStyle(color: Color(0xff666666)),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
