import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/get_hotels_data_use_case.dart';
import 'get_hotels_data_states.dart';

class GetHotelsDataCubit extends Cubit<GetHotelsDataStates> {
  GetHotelsDataUseCase getHotelsDataUseCase;

  GetHotelsDataCubit(this.getHotelsDataUseCase)
      : super(GetHotelsDataInitialState());

  static GetHotelsDataCubit get(context) => BlocProvider.of(context);

  getHotelsData() async {
    var data = await getHotelsDataUseCase();
    data.fold(
      (failure) => emit(GetHotelsDataErrorState(failure.error)),
      (hotels) => emit(GetHotelsDataSuccessfullyState(hotels)),
    );
  }
}
