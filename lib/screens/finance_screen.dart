import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List finances = [];

  @override
  void initState() {
    super.initState();
    fetchFinances();
  }

  fetchFinances() async {
    final response = await http.get(Uri.parse('http://<BACKEND_URL>/finance'));
    if (response.statusCode == 200) {
      setState(() {
        finances = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance'),
      ),
      body: ListView.builder(
        itemCount: finances.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(finances[index]['description']),
            subtitle: Text('\$${finances[index]['amount']}'),
          );
        },
      ),
    );
  }
}
