import 'package:flutter/material.dart';
import 'package:hinstagram/views/feed_view.dart';
import 'package:hinstagram/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const FeedView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hinstagram'),
        actions: [
          GestureDetector(
            onTap: (){},
            child: const Icon(Icons.add_photo_alternate_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.logout_outlined),
            ),
          ),
          const SizedBox(width:12,),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNavigationBar (){
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage = _index;
        });
      },
      items: const[
        BottomNavigationBarItem(
          //label is required and in the case label is not provided, the app will crush
          label: 'Feed',
          icon: Icon(Icons.feed),
        ),
        BottomNavigationBarItem(
          //label is required and in the case label is not provided, the app will crush
          label: 'Profile',
          icon: Icon(Icons.account_box_outlined),
        ),
      ],
    );
  }
}
