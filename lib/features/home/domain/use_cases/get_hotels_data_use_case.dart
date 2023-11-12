import 'package:dartz/dartz.dart';
import 'package:hotelsgo_task/core/failure/failure.dart';
import 'package:hotelsgo_task/core/use_case/use_case.dart';
import 'package:hotelsgo_task/features/home/domain/repos/home_repo.dart';
import '../../../../core/utils/no_param/no_param.dart';
import '../../data/models/hotel_model.dart';

class GetHotelsDataUseCase extends UseCase<List<HotelModel>,NoParam>{
  HomeRepo homeRepo ;
  GetHotelsDataUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<HotelModel>>> call([NoParam? param])async {
    return await homeRepo.getHotelsData();
  }
}