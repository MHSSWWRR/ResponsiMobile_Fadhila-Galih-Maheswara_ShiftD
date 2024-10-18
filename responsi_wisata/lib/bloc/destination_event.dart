import 'package:meta/meta.dart';

@immutable
abstract class DestinationEvent {}

class FetchDestinations extends DestinationEvent {}

class CreateDestination extends DestinationEvent {
  final String destination;
  final String location;
  final String attraction;

  CreateDestination({
    required this.destination,
    required this.location,
    required this.attraction,
  });
}

class UpdateDestination extends DestinationEvent {
  final int id;
  final String destination;
  final String location;
  final String attraction;

  UpdateDestination({
    required this.id,
    required this.destination,
    required this.location,
    required this.attraction,
  });
}

class DeleteDestination extends DestinationEvent {
  final int id;

  DeleteDestination({required this.id});
}
