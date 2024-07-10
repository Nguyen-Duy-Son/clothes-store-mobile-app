import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterLocationView extends StatefulWidget {
  const EnterLocationView({super.key});

  @override
  State<EnterLocationView> createState() => _EnterLocationViewState();
}

class _EnterLocationViewState extends State<EnterLocationView> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter Your Location'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search location',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
