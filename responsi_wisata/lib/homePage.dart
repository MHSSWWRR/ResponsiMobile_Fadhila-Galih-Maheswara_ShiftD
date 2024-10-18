import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailPage.dart';
import 'createPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List destinations = [];

  Future<void> fetchDestinations() async {
    final response = await http.get(
        Uri.parse('http://103.196.155.42/api/pariwisata/destinasi_wisata'));
    if (response.statusCode == 200) {
      setState(() {
        destinations = json.decode(response.body)['data'];
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tourism Management')),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(destinations[index]['destination']),
            subtitle: Text(destinations[index]['location']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(destination: destinations[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
