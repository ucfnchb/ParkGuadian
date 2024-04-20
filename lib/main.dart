// import packages
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // storage
import 'package:park/hive_ext.dart';
import './report_issues_page.dart';
import './reports_page.dart';

Future<void> main() async {
  await Hive.initHive(); // phone local storage
  runApp(const MyApp());
}
// stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park Guardian', // the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // color theme
      ),
      home: const MyHomePage(), // the home widget. displayed first
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    const ReportIssuesPage(), //widget for report issues
    const ReportsPage(), // widget for viewing my reported issues
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; //index updating
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], //display selected tab
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff154406),//dark green color
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false, // hide labels for selected tabs
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined), //icon for map, first tab
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // my report icon
            label: ""
          )
        ],
      ),
    );
  }
}
