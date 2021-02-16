import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sandtonchurchapp/screens/booking/book_event.dart';
import 'calendar/calendar_events.dart';
import '../constants/color_scheme.dart';
import 'list/view_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Navigation(); //Scaffold(
  }
}

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    CalendarEvents(),
    ListEvents(),
    BookEvent(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.lightgrey,
          selectedItemColor: AppColors.guava,
          unselectedItemColor: AppColors.grey,
          
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendar, size: 20),
              label: '____',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidListAlt,
                size: 20,
              ),
              label: '____',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarPlus, size: 20),
              label: '____',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          elevation: 0),
    );
  }
}
