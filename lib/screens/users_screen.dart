import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    final response = await http.get(Uri.parse('http://<BACKEND_URL>/users'));
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['name']),
            subtitle: Text(users[index]['belt']),
          );
        },
      ),
    );
  }
}
