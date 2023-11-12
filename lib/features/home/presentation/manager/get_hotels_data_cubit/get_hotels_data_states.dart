import '../../../data/models/hotel_model.dart';

abstract class GetHotelsDataStates{}

class GetHotelsDataInitialState extends GetHotelsDataStates{}

class GetHotelsDataLoadingState extends GetHotelsDataStates{}
class GetHotelsDataSuccessfullyState extends GetHotelsDataStates{
  final List<HotelModel> hotels ;
  GetHotelsDataSuccessfullyState(this.hotels);
}
class GetHotelsDataErrorState extends GetHotelsDataStates{
  final String error ;
  GetHotelsDataErrorState(this.error);
}

