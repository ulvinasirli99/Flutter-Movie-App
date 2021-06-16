import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/mixins/connectivy_controller.dart';
import 'package:tmdb_movie_app/screen/home/account.dart';
import 'package:tmdb_movie_app/screen/home/home.dart';
import 'package:tmdb_movie_app/screen/home/popular.dart';

class AllPagesNavigation extends StatefulWidget {
  @override
  _AllPagesNavigationState createState() => _AllPagesNavigationState();
}

class _AllPagesNavigationState extends State<AllPagesNavigation>
    with ConnectivyMixin {
  int bottomItemIndex = 0;
  List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      Home(),
      PopularMoviePage(),
      AccountPage(),
    ];
    super.initState();
    connectionCheckResult(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[bottomItemIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: bottomItemIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/hot.png",
                width: 35,
                height: 35,
              ),
              label: "Films",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.restore,
                  size: 35,
                  color: Colors.black,
                ),
                label: "Min"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: "Account",
            ),
          ],
          backgroundColor: Colors.lightGreen.shade400.withOpacity(0.6),
          onTap: (state) {
            setState(() {
              bottomItemIndex = state;
            });
          },
        ),
      ),
    );
  }
}
