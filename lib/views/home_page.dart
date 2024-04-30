// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tab Bar',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 237, 184, 247),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Posts'),
            Tab(text: 'Photos'),
            Tab(text: 'Comments'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PostScreen(),
          PhotoScreen(),
          CommentScreen(),
        ],
      ),
    );
  }
}
