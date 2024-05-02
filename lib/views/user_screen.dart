// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "id",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              "site",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(
              width: 1,
            ),
          ],
        ),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 225, 165, 237),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _userModel![index].id.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              _userModel![index].username,
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              _userModel![index].email,
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              _userModel![index].website,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
