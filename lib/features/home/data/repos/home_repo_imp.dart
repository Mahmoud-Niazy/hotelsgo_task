import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotelsgo_task/core/failure/failure.dart';
import 'package:hotelsgo_task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:hotelsgo_task/features/home/data/models/hotel_model.dart';
import 'package:hotelsgo_task/features/home/domain/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<HotelModel>>> getHotelsData()async {
    try{
      var hotels = await homeRemoteDataSource.getHotelsData();
      return right(hotels);
    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioException(error));
      }
      else{
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
