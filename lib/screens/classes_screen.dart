import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  List classes = [];

  @override
  void initState() {
    super.initState();
    fetchClasses();
  }

  fetchClasses() async {
    final response = await http.get(Uri.parse('http://<BACKEND_URL>/classes'));
    if (response.statusCode == 200) {
      setState(() {
        classes = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(classes[index]['name']),
            subtitle: Text(classes[index]['instructor']),
          );
        },
      ),
    );
  }
}
