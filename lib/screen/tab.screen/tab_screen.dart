import 'package:collage_app/screen/tab.screen/home.screen/home.dart';
import 'package:collage_app/screen/tab.screen/profile.screen/profile.dart';
import 'package:collage_app/screen/tab.screen/saved.screen/saved.dart';
import 'package:collage_app/screen/tab.screen/search.screen/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class TabScreen extends StatelessWidget {
  TabScreen({super.key});
  final List<Widget> _pages = [
    const HomeTab(),
    const SearchTab(),
    const SavedTab(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<TabViewProvider>(context);

    return Scaffold(
      body: _pages[navigationProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) {
          navigationProvider.updateCurrentIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Remix.home_2_fill,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Remix.search_eye_line,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Remix.bookmark_fill,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Remix.user_fill,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}

class TabViewProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
