// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:api_demo/views/user_screen.dart';
import 'package:flutter/material.dart';
import 'comments_screen.dart';
import 'posts_screen.dart';
import 'photos_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var isLoaded = false;
  late TabController _tabController;

  final List<Tab> tabs = [
    const Tab(text: 'Posts'),
    const Tab(text: 'Photos'),
    const Tab(text: 'Comments'),
    const Tab(text: 'Users'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tab Bar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 217, 97, 241),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Colors.white,
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PostScreen(),
          PhotoScreen(),
          CommentScreen(),
          UserScreen(),
        ],
      ),
    );
  }
}
