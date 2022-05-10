import 'package:concord/screens/explore_screen.dart';
import 'package:concord/screens/music_screen.dart';
import 'package:concord/screens/search_screen.dart';
import 'package:concord/utils/theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index){
   setState(() {
     _selectedIndex = index;
   });
   pageController.animateToPage(index,duration: Duration(milliseconds: 300),curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          MusicScreen(),
          ExploreScreen(),
          SearchScreen(),
          Container(color: Colors.green),
        ],
        controller: pageController,
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.music_note),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.image),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: ''),
      ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: onTapped,
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
          ),
    );
  }
}


