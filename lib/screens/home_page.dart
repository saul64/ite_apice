import 'package:flutter/material.dart';
import 'package:ite_apice/components/bottom_navigation_bar.dart';
import 'package:ite_apice/screens/my_profile_page.dart';
import 'package:ite_apice/screens/my_saves_page.dart';
import 'package:ite_apice/screens/services_offers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bar 
  int _selectecIndex = 1;
  void navigationBottomBar(int index){
    setState((){
    _selectecIndex = index;
  });
  }

//pages
final List<Widget> _pages = [
  MySavesPage(),
  ServicesOffersPage(),
  MyProfilePage()

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomCustomNavigationBar(
        onTabChange: (index)=> navigationBottomBar(index),
      ),
      body: _pages[_selectecIndex],
    );
  }
}