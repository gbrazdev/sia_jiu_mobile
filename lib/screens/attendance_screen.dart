import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List attendance = [];

  @override
  void initState() {
    super.initState();
    fetchAttendance();
  }

  fetchAttendance() async {
    final response =
        await http.get(Uri.parse('http://<BACKEND_URL>/attendance'));
    if (response.statusCode == 200) {
      setState(() {
        attendance = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${attendance[index]['user']['name']} - ${attendance[index]['class']['name']}'),
            subtitle:
                Text(attendance[index]['confirmed'] ? 'Confirmed' : 'Pending'),
          );
        },
      ),
    );
  }
}
