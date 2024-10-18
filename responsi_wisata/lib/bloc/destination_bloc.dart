import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../helpers/api.dart';
import '../../helpers/api_url.dart';
import 'destination_event.dart';
import 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(DestinationInitial());

  @override
  Stream<DestinationState> mapEventToState(DestinationEvent event) async* {
    if (event is FetchDestinations) {
      yield DestinationLoading();
      try {
        final response = await Api().get(ApiUrl.getAllDestinations);
        yield DestinationLoaded(response['data']);
      } catch (e) {
        yield DestinationError("Failed to fetch destinations");
      }
    } else if (event is CreateDestination) {
      yield DestinationLoading();
      try {
        final response = await Api().post(ApiUrl.createDestination, {
          'destination': event.destination,
          'location': event.location,
          'attraction': event.attraction,
        });
        yield DestinationSuccess("Destination created successfully");
      } catch (e) {
        yield DestinationError("Failed to create destination");
      }
    } else if (event is UpdateDestination) {
      yield DestinationLoading();
      try {
        final response = await Api().put(
          ApiUrl.updateDestination + event.id.toString() + '/update',
          {
            'destination': event.destination,
            'location': event.location,
            'attraction': event.attraction,
          },
        );
        yield DestinationSuccess("Destination updated successfully");
      } catch (e) {
        yield DestinationError("Failed to update destination");
      }
    } else if (event is DeleteDestination) {
      yield DestinationLoading();
      try {
        await Api()
            .delete(ApiUrl.deleteDestination + event.id.toString() + '/delete');
        yield DestinationSuccess("Destination deleted successfully");
      } catch (e) {
        yield DestinationError("Failed to delete destination");
      }
    }
  }
}
