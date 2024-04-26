import 'package:flutter/material.dart';
import 'package:wx_reader_book/pages/discover_page.dart';
import 'package:wx_reader_book/pages/look_page.dart';
import 'package:wx_reader_book/pages/my_self_page.dart';
import 'package:wx_reader_book/pages/self_page.dart';
import 'package:wx_reader_book/pages/shelf_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
        body: PageView(
          controller: controller,
          children: [
            const DiscoverPage(),
            const ShelfPage(),
            const LookPage(),
            // MySelfPage()
            SelfPage()
          ],
        ),
        bottomNavigationBar: StatefulBuilder(
          builder: (context, setState) {
            return BottomNavigationBar(
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.public), label: 'Discovery'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_books), label: 'Shelf'),
                BottomNavigationBarItem(icon: Icon(Icons.hub), label: 'Look'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'MySelf'),
              ],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black45,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              iconSize: 24,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                  controller.jumpToPage(currentIndex);
                });
              },
            );
          },
        ));
  }
}
