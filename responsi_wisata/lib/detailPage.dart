import 'package:flutter/material.dart';
import 'editPage.dart';

class DetailPage extends StatelessWidget {
  final Map destination;

  const DetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination['destination'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Destination: ${destination['destination']}",
                style: const TextStyle(fontSize: 18)),
            Text("Location: ${destination['location']}",
                style: const TextStyle(fontSize: 18)),
            Text("Attraction: ${destination['attraction']}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPage(destination: destination),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
