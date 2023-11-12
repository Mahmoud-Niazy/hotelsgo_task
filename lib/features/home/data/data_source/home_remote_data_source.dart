import 'package:hotelsgo_task/core/api_services/api_services.dart';

import '../models/hotel_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HotelModel>> getHotelsData();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);

  @override
  Future<List<HotelModel>> getHotelsData() async{
    var data = await  apiServices.getData(
      endPoint: 'test/hotels',
    );
    List<HotelModel> hotels = [];
    for(var hotel in data){
      hotels.add(HotelModel.formJson(hotel));
    }
    return hotels ;
  }
}
