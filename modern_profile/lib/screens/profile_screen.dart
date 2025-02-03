// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';
import 'package:modern_profile/components/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';
import 'package:modern_profile/screens/editprofile_screen.dart';
import 'package:modern_profile/screens/favorite_screen.dart';
import 'package:modern_profile/screens/home_screen.dart';
import 'package:modern_profile/screens/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

  void _navigationBottonBar(int index){
    setState(() {
      _selectedItem = index;
      print(_selectedItem);
    });
  }
  final List<Widget> _pages = [
    //Text('home'),
    //Text('favorite'),
    //Text('setting'),
    Home(),
    FavoriteScreen(),
    SettingScreen(),
    EditProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 20,
          color: iconPrimary,
        ),
        title: Center(
            child: Text(
          '',  //'Edit Profile',
          style: texttitle,
        )),
        actions: const [
          Icon(
            Icons.exit_to_app,
            size: 24,
            color: iconPrimary,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _navigationBottonBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: iconPrimary,
              ),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: iconPrimary,
              ),
              label: 'Favorite'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
                color: iconPrimary,
              ),
              label: 'Setting'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
                color: iconPrimary,
              ),
              label: 'Edit Profile'
          ),
        ],
      ),
    );
  }
}
