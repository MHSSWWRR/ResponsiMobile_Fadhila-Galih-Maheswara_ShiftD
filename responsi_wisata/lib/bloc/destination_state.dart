import 'package:meta/meta.dart';

@immutable
abstract class DestinationState {}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationLoaded extends DestinationState {
  final List<dynamic> destinations;

  DestinationLoaded(this.destinations);
}

class DestinationSuccess extends DestinationState {
  final String message;

  DestinationSuccess(this.message);
}

class DestinationError extends DestinationState {
  final String message;

  DestinationError(this.message);
}
