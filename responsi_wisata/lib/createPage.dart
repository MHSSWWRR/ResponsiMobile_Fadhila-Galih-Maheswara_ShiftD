import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class CreatePage extends StatelessWidget {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController attractionController = TextEditingController();

  CreatePage({super.key});

  Future<void> createDestination(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://103.196.155.42/api/pariwisata/destinasi_wisata'),
      body: {
        'destination': destinationController.text,
        'location': locationController.text,
        'attraction': attractionController.text,
      },
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Destination created successfully');
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: 'Failed to create destination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Destination')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: destinationController,
                decoration: const InputDecoration(labelText: 'Destination')),
            TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location')),
            TextField(
                controller: attractionController,
                decoration: const InputDecoration(labelText: 'Attraction')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => createDestination(context),
              child: const Text('Create Destination'),
            ),
          ],
        ),
      ),
    );
  }
}
