import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class EditPage extends StatelessWidget {
  final Map destination;
  final TextEditingController destinationController;
  final TextEditingController locationController;
  final TextEditingController attractionController;

  EditPage({super.key, required this.destination})
      : destinationController =
            TextEditingController(text: destination['destination']),
        locationController =
            TextEditingController(text: destination['location']),
        attractionController =
            TextEditingController(text: destination['attraction']);

  Future<void> updateDestination(BuildContext context) async {
    final response = await http.put(
      Uri.parse(
          'http://103.196.155.42/api/pariwisata/destinasi_wisata/${destination['id']}/update'),
      body: {
        'destination': destinationController.text,
        'location': locationController.text,
        'attraction': attractionController.text,
      },
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Destination updated successfully');
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: 'Failed to update destination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Destination')),
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
              onPressed: () => updateDestination(context),
              child: const Text('Update Destination'),
            ),
          ],
        ),
      ),
    );
  }
}
