import 'package:dartz/dartz.dart';
import 'package:hotelsgo_task/core/failure/failure.dart';
import '../../data/models/hotel_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<HotelModel>>>getHotelsData();
}